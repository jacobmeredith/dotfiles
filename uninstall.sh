#!/usr/bin/env bash

stow -t ~ -D zsh
stow -t ~/.config -D nvim
stow -t ~/.config -D tmux
stow -t ~/.config -D alacritty
stow -t ~/.config -D oh-my-posh
stow -t ~/.config -D starship

brew uninstall starship
brew uninstall fzf
brew uninstall neovim
brew uninstall nvm
brew uninstall pnpm
brew uninstall stow
brew uninstall tmux
brew uninstall wget
brew uninstall tree-sitter
brew uninstall ripgrep
brew uninstall yarn
brew uninstall jandedobbeleer/oh-my-posh/oh-my-posh
brew uninstall fastfetch

brew uninstall --cask alacritty
brew uninstall --cask font-jetbrains-mono-nerd-font
brew uninstall --cask raycast
brew uninstall --cask fork
brew uninstall --cask font-symbols-only-nerd-font

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
