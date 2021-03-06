# If not running interactively, don't do anything
[[ $- != *i* ]] && return

loaded_bashrc=1

# macOS runs a login shell for each new terminal. In that case, ~/.profile will
# be loaded instead. Load profile here for consistency.
[[ -z "$loaded_profile" ]] && . ~/.profile

# Set default text editor and pager
export VISUAL="nvim"
export EDITOR="$VISUAL"
export PAGER="less"
export LESS="-R"

# Load `~/.bashrc.local` if exists
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# Fish is not fully compatible with POSIX. By keeping Bash as the default shell,
# ensures the environment variables are set correctly. Only then we start Fish
# as the interactive shell.
exec fish
