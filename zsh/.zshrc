export NVM_DIR=~/.nvm

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export PATH=/opt/homebrew/bin:$PATH

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/my-oh-my-posh.omp.json)"

plugins=(git zsh-syntax-highlighting)

source $(brew --prefix nvm)/nvm.sh

# pnpm
export PNPM_HOME="/Users/jacobmeredith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim=nvim

alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gch="git checkout"
alias gaa="git add ."
alias gac="git add -A && git commit -m"

fastfetch
