# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  zgen prezto prompt theme 'sorin'
  # specify plugins here
  zgen prezto
  zgen prezto git
  zgen prezto syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi
alias vim=nvim
