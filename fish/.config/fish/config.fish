# Supress welcome message
set -e fish_greeting

# Load config snippets
for file in $HOME/.config/fish/configs/*.fish
  source $file
end
