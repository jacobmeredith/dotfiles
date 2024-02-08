#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install starship
brew install fzf
brew install neovim
brew install nvm
brew install pnpm
brew install stow
brew install tmux
brew install wget
brew install tree-sitter
brew install ripgrep
brew install yarn
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install fastfetch

brew install --cask alacritty
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask raycast
brew install --cask fork
brew install --cask font-symbols-only-nerd-font 

stow -t ~ -S zsh
stow -t ~/.config -S nvim
stow -t ~/.config -S tmux
stow -t ~/.config -S alacritty
stow -t ~/.config -S oh-my-posh
stow -t ~/.config -S starship
