task :default => :all

task :all => [:fish, :git, :tmux, :ag]

task :fish do
  Rake::Task[:stow].execute target: "~", source: "fish"
end

task :git do
  Rake::Task[:stow].execute target: "~", source: "git"
end

task :tmux do
  Rake::Task[:stow].execute target: "~", source: "tmux"
end

task :ag do
  Rake::Task[:stow].execute target: "~", source: "ag"
end

task :stow, [:target, :source] do |t, args|
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
      if File.exist?(target_path)
        unless File.symlink?(target_path) and File.realpath(target_path) == source_path
          abort "stow: #{target_path} already exists"
        end
      else
        File.symlink(source_path, target_path)
      end
    end
  end
end

