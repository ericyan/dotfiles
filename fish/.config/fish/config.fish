# Aliases
alias vi "nvim"
alias tmux "tmux -2"
alias mkdir "mkdir -pv"

# Colour scheme
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-ocean.sh
end

# Set syntax highlighting colours
set fish_color_command blue --bold
set fish_color_error blue

set fish_color_param cyan
set fish_color_operator cyan
set fish_color_escape cyan

set fish_color_quote green

set fish_color_redirection magenta
set fish_color_end magenta

set fish_color_match yellow
set fish_color_search_match yellow
set fish_color_history_current yellow

set fish_color_comment 65737e
set fish_color_autosuggestion 4f5b66
set fish_color_selection black --background yellow

set fish_color_cwd blue
set fish_color_cwd_root red
set fish_color_user cyan
set fish_color_host cyan

set fish_pager_color_prefix blue
set fish_pager_color_completion normal
set fish_pager_color_description cyan
set fish_pager_color_progress blue

# Supress welcome message
set -e fish_greeting
