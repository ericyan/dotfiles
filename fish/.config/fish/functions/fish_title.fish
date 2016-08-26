function fish_title
  if test $_ = 'fish'
    echo (whoami)@(hostname): (pwd | command sed "s:^$HOME:~:")
  else
    echo $_
  end
end
