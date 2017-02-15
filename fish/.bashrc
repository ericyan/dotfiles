# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# macOS runs a login shell for each new terminal. In that case, ~/.profile will
# be loaded instead. Load profile here for consistency.
[[ -f ~/.profile ]] && . ~/.profile

# Load `~/.bashrc.local` if exists
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# Set default text editor and pager
export VISUAL="nvim"
export EDITOR="$VISUAL"
export PAGER="less"
export LESS="-R"

# Fish is not fully compatible with POSIX. By keeping Bash as the default shell,
# ensures the environment variables are set correctly. Only then we start Fish
# as the interactive shell.
exec fish
