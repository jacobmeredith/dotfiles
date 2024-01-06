export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR=~/.nvm

export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=/opt/homebrew/bin:$PATH:$GOPATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


plugins=(git zsh-syntax-highlighting)

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh

alias vim=nvim
