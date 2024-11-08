#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v volta &>/dev/null; then
	curl https://get.volta.sh | bash
fi

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
brew install btop
brew install lua
brew install nowplaying-cli
brew install orbstack
brew install switchaudio-osx
brew install zsh-autosuggestions
brew install tree

brew tap FelixKratz/formulae
brew install borders
brew install sketchybar

# Fonts
brew install --cask sf-symbols
brew install --cask homebrew/cask-fonts/font-sf-mono
brew install --cask homebrew/cask-fonts/font-sf-pro
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-symbols-only-nerd-font

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

brew install --cask nikitabobko/tap/aerospace
brew install --cask google-chrome
brew install --cask alacritty

stow -t ~ -S zsh
stow -t ~/.config -S starship
stow -t ~/.config -S tmux
stow -t ~/.config -S nvim
stow -t ~/.config -S aerospace
stow -t ~/.config -S alacritty
stow -t ~/.config -S sketchybar

(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
brew services start sketchybar
