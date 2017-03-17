function fish_user_key_bindings
  for file in $HOME/.config/fish/key_bindings/*.fish
    source $file
  end
end
