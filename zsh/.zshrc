eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/my-oh-my-posh.omp.json)"

export NVM_DIR=~/.nvm

export PATH=/opt/homebrew/bin:$PATH

plugins=(git zsh-syntax-highlighting)

source $(brew --prefix nvm)/nvm.sh

# pnpm
export PNPM_HOME="/Users/jacobmeredith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


alias vim=nvim

alias gs="git status"
alias gd="git commit"
alias gd="git diff"
alias gch="git checkout"
alias gaa="git add ."
