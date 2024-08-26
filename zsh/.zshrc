export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

# pnpm
export PNPM_HOME="/Users/jakemeredith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
