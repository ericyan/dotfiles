function fish_prompt
  set -l cwd (set_color $fish_color_cwd) (pwd | sed "s:^$HOME:~:")
  set -l prompt (set_color $fish_color_comment) ' » '

  echo -e -n -s '\n' $cwd $prompt
  set_color normal
end
