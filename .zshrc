export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

export PATH=/opt/homebrew/bin:$PATH

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

fcd() {
  cd "$(find . -mindepth 1 -type d | fzf --preview 'tree -C {} | head -200' --preview-window 'up:60%')"
}

fe() {
  nvim "$(find . -type f | fzf --preview 'cat {}' --preview-window 'up:60%')"
}

fw() {
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

workspace() {
  cd $1
  tmux new-session -n neovim "nvim . ; zsh" \; new-window -n terminal "$2 ; zsh" \; attach
}

alias bt="btop"
alias cat="bat"
alias la="eza -TL 2 --icons"
alias lg="lazygit"
alias ls="eza -l --icons"
