#!/usr/bin/env zsh

function() {
  local here="$(cd "$(dirname "${(%):-%x}")" && pwd)"
  export DISPLAY=:0

  local load=(
    ~/.config/zshrc.d/brew.zs[h](N)
    /usr/share/autojump/autojump.zs[h](N)
    # [h] -> POG to activate glob
  )
  for fp in $load; source "$fp"

  "$here/vcxsrv.zsh"

  export SKIP_TMUX="true"
  export SUDO_ASKPASS=/usr/bin/ssh-askpass
  export GIT_ASKPASS=/usr/bin/ssh-askpass
  export SSH_ASKPASS=/usr/bin/ssh-askpass
  exec emacs
}
