# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  zgen prezto prompt theme 'sorin'
  # specify plugins here
  zgen prezto
  zgen prezto git
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

  # generate the init script from plugins above
  zgen save
fi
export TERM=xterm-256color
alias vim=nvim
alias dotfiles='git --git-dir=.dotfiles.git'
alias tab='qterminal -w $(pwd) &'
alias stream='mpv --force-seekable=yes'
pr() {
 local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
 local branch=`git name-rev --name-only HEAD`
 unamestr=`uname`
 if [[ "$unamestr" == 'Linux'  ]]; then
   xdg-open https://github.com/$repo/pull/new/$branch
 else
   open https://github.com/$repo/pull/new/$branch
 fi
}
alias mr=pr
alias say='echo "$1" | espeak -v english-us -s 120 2>/dev/null'
