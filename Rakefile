task :default => :all

task :all => [:nvim, :fish, :git, :tmux, :ag, :curl, :fzf, :golang, :ruby]

task :nvim => [:curl, :fzf] do
  pkg "nvim", apt: "neovim", brew: "neovim/neovim/neovim"
  Rake::Task[:stow].execute target: "~/.config/nvim", source: "nvim"

  unless File.exist?(File.expand_path("~/.local/share/nvim/site/autoload/plug.vim"))
    puts "Installing vim-plug..."
    `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  end

  unless Dir.exist?(File.expand_path("~/.local/share/nvim/plugged"))
    puts "Installing NeoVim plugins..."
    `nvim +PlugInstall +qall`
  end
end

task :fish do
  pkg "fish", apt: "fish", brew: "fish"

  backups = {
    "~/.bashrc" => "~/.bashrc.local",
    "~/.profile" => "~/.profile.d/profile.local",
    "~/.bash_profile" => "~/.profile.d/bash_profile.local"
  }
  FileUtils.mkdir_p File.expand_path("~/.profile.d")

  backups.each_pair do |old, new|
    f = File.expand_path(old)
    if File.exist?(f) and not File.symlink?(f)
      puts "#{old} already exists, backing up..."
      mv f, File.expand_path(new)
    end
  end

  Rake::Task[:stow].execute target: "~", source: "fish"
end

task :git do
  pkg "git", apt: "git", brew: "git"
  Rake::Task[:stow].execute target: "~", source: "git"

  gitconfig_path = File.expand_path("~/.gitconfig.local")
  unless File.exist?(gitconfig_path)
    puts "Setting up Git user..."
    STDOUT.print "Name: "
    name = STDIN.gets.chomp
    STDOUT.print "Email: "
    email = STDIN.gets.chomp

    File.open(gitconfig_path, "w") do |f|
      f.puts "[user]"
      f.puts "name = #{name}"
      f.puts "email = #{email}"
    end

    puts "User data written to ~/.gitconfig.local"
  end
end

task :tmux do
  pkg "tmux", apt: "tmux", brew: "tmux"
  Rake::Task[:stow].execute target: "~", source: "tmux"
end

task :ag do
  pkg "ag", apt: "silversearcher-ag", brew: "the_silver_searcher"
  Rake::Task[:stow].execute target: "~", source: "ag"
end

task :curl do
  pkg "curl", apt: "curl", brew: "curl"
  Rake::Task[:stow].execute target: "~", source: "curl"
end

task :fzf => [:golang, :ag] do
  `GOPATH=$HOME/Workspace go get -v github.com/junegunn/fzf/src/fzf`

  Rake::Task[:stow].execute target: "~", source: "fzf"
end

task :golang => [:fish, :git] do
  pkg "go", apt: "golang", brew: "go"

  # `~/Workspace` will be the GOPATH
  FileUtils.mkdir_p File.expand_path("~/Workspace")

  Rake::Task[:stow].execute target: "~", source: "golang"

  STDOUT.print "Do you want to install extra Go tools? [Y/n] "
  if STDIN.gets.chomp.downcase == "y"
    go_tools = [
      "github.com/nsf/gocode",
      "github.com/alecthomas/gometalinter",
      "golang.org/x/tools/cmd/goimports",
      "golang.org/x/tools/cmd/guru",
      "golang.org/x/tools/cmd/gorename",
      "github.com/golang/lint/golint",
      "github.com/rogpeppe/godef",
      "github.com/kisielk/errcheck",
      "github.com/jstemmer/gotags",
      "github.com/klauspost/asmfmt/cmd/asmfmt",
      "github.com/fatih/motion",
      "github.com/fatih/gomodifytags",
      "github.com/zmb3/gogetdoc",
      "github.com/josharian/impl",
    ].join(" ")

    `GOPATH=$HOME/Workspace go get -v #{go_tools}`
  end
end

task :ruby => [:fish, :git] do
  git "https://github.com/rbenv/rbenv.git" => "~/.rbenv",
      "https://github.com/rbenv/ruby-build.git" => "~/.rbenv/plugins/ruby-build"

  Rake::Task[:stow].execute target: "~", source: "ruby"
end

task :stow, [:target, :source] do |t, args|
  FileUtils.mkdir_p File.expand_path(args[:target])

  [args[:target], args[:source]].each do |dir|
    abort "stow: #{dir} is not a directory" unless Dir.exist?(File.expand_path(dir))
  end

  require 'find'
  Find.find(args[:source]) do |p|
    next if p == args[:source]

    path = p.sub(args[:source] + "/", "")
    source_path = File.expand_path("#{args[:source]}/#{path}")
    target_path = File.expand_path("#{args[:target]}/#{path}")

    if File.directory?(source_path)
      Dir.mkdir(target_path) unless File.exist?(target_path)
    else
      make_symlink(source_path, target_path)
    end
  end
end

def make_symlink(source_path, target_path)
  if File.exist?(target_path)
    unless File.symlink?(target_path) and File.realpath(target_path) == source_path
      abort "ln_s: #{target_path} already exists"
    end
  else
    File.symlink(source_path, target_path)
  end
end

def pkg(binary, package)
  # NOTE: If binary is installed to sbin, need run as root to see it.
  return if system("command -v #{binary} >/dev/null 2>&1")

  case `uname -s`.strip
  when "Linux"
    sh "sudo apt-get install -y #{package[:apt]}"
  when "Darwin"
    sh "brew install #{package[:brew]}"
  else
    abort "This OS is not supported."
  end
end

def git(hash)
  hash.each do |repo, path|
    if not File.directory?(File.expand_path(path))
      `git clone #{repo} #{path}`
    else
      `cd #{path} && git pull`
    end
  end
end
