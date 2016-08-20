function fish_prompt
  set -l cwd (set_color $fish_color_cwd) (pwd | sed "s:^$HOME:~:")
  set -l prompt (set_color $fish_color_autosuggestion) ' » '

  set -l git_branch (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  if [ $git_branch ]
    if [ (command git status -s --ignore-submodules=dirty ^/dev/null) ]
      set git_indicator (set_color d08770) '*' (set_color cyan)
    end

    set git_info (set_color cyan) ' (' $git_branch $git_indicator ')'
  end

  echo -e -n -s '\n' $cwd $git_info $prompt
  set_color normal
end
