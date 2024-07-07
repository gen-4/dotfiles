function fish_prompt
  set -l last_status $status

  if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
  end
  if not set -q __fish_git_prompt_color_branch
    set -g __fish_git_prompt_color_branch brmagenta
  end
  if not set -q __fish_git_prompt_showupstream
    set -g __fish_git_prompt_showupstream "informative"
  end
  if not set -q __fish_git_prompt_showdirtystate
    set -g __fish_git_prompt_showdirtystate "yes"
  end
  if not set -q __fish_git_prompt_color_stagedstate
    set -g __fish_git_prompt_color_stagedstate yellow
  end
  if not set -q __fish_git_prompt_color_invalidstate
    set -g __fish_git_prompt_color_invalidstate red
  end
  if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate brgreen
  end

  set  suffix '>'
  if functions -q fish_is_root_user; and fish_is_root_user
    set suffix '#'
  end

  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  set_color normal

  set cwd (pwd)
  set cwd (string replace -r "^$HOME" "~" $cwd)

  echo -n -s '[' (date '+%H:%M') '] ' (set_color $fish_color_user) $USER (set_color normal) '@' (set_color $fish_color_host) (prompt_hostname) ' ' (set_color $fish_color_cwd) $cwd (set_color normal) (__fish_git_prompt) ' ' $suffix ' '


end
