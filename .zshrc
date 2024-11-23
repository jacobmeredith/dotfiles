export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

export PATH=/opt/homebrew/bin:$PATH

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

alias ls="eza -l --icons"
alias la="eza -TL 2 --icons"
alias cat="bat"
alias lg="lazygit"
