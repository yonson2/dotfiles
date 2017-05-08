set TERM xterm-256color
alias vim "nvim"
alias ovim "usr/bin/vim"
alias dotfiles "git --git-dir=.dotfiles.git"
alias stream "mpv --force-seekable=yes"
alias gpg4usb "exec /home/peter/Documents/gpg4usb/start_linux_64bit"

bind \cr re_search
# pr() {
#  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
#  local branch=`git name-rev --name-only HEAD`
#  unamestr=`uname`
#  if [[ "$unamestr" == 'Linux'  ]]; then
#    xdg-open https://github.com/$repo/pull/new/$branch
#  else
#    open https://github.com/$repo/pull/new/$branch
#  fi
# }
