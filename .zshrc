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
# alias vim=nvim
alias dotfiles='git --git-dir=.dotfiles.git'
