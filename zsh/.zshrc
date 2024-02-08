export NVM_DIR=~/.nvm

export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=/opt/homebrew/bin:$PATH:$GOPATH

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

plugins=(git zsh-syntax-highlighting)

source $(brew --prefix nvm)/nvm.sh

alias vim=nvim

alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias gp="git push"
alias gch="git checkout"
alias gaa="git add ."
alias gac="git add -A && git commit -m"

fastfetch
