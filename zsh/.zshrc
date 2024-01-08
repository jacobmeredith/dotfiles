eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/my-oh-my-posh.omp.json)"

export NVM_DIR=~/.nvm

export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=/opt/homebrew/bin:$PATH:$GOPATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

plugins=(git zsh-syntax-highlighting)

source $(brew --prefix nvm)/nvm.sh

alias vim=nvim

alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gch="git checkout"
alias gaa="git add ."
