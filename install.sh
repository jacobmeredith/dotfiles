#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
	exit 1
fi

curl https://get.volta.sh | bash

mkdir ~/.config

brew install neovim
brew install starship
brew install fastfetch
brew install ripgrep
brew install fzf
brew install tmux
brew install tree-sitter
brew install jesseduffield/lazygit/lazygit
brew install stow

brew install --cask raycast
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-symbols-only-nerd-font
brew install --cask google-chrome
brew install --cask alacritty

stow -t ~ -S zsh
stow -t ~/.config -S starship
stow -t ~/.config -S tmux
stow -t ~/.config -S nvim
stow -t ~/.config -S aerospace
stow -t ~/.config -S alacritty
stow -t ~/.config -S sketchybar
