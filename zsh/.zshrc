export NVM_DIR=~/.nvm

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/my-oh-my-posh.omp.json)"

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

alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias gp="git push"
alias gch="git checkout"
alias gaa="git add ."
alias gac="git add -A && git commit -m"

fastfetch
