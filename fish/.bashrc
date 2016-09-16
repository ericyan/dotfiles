# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load `~/.bashrc.local` if exists
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# Fish is not fully compatible with POSIX. By keeping Bash as the default shell,
# ensures the environment variables are set correctly. Only then we start Fish
# as the interactive shell.
exec fish
