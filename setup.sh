#!/usr/bin/env bash

# Install dependencies
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew_packages=(
	git
	neovim
	tmux
	zsh
	fzf
	ripgrep
)

echo "Installing brew packages"
brew install "${brew_packages[@]}"

brew_casks=(
	iterm2
	rectangle
	maccy
	raycast
	google-chrome
	fork
)

echo "Installing brew casks"
brew install --cask "${brew_casks[@]}"

config_files=(
	tmux
	nvim
	iterm2
)

echo "Copying config files"
for file in "${config_files[@]}"; do
  if [ -d "$HOME/.config/$file" ]; then
    echo "Move existing $file config to $file.old"
    mv "$HOME/.config/$file" "$HOME/.config/$file.old"
  fi 

  cp -R "$file" "$HOME/.config/$file"
done

# Install oh-my-zsh
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Rename .zshrc to .zshrc.old
if [ -f "$HOME/.zshrc" ]; then
  echo "Renaming .zshrc to .zshrc.old"
  mv "$HOME/.zshrc" "$HOME/.zshrc.old"
fi

# Copy .zshrc
if ! [ -f "$HOME/.zshrc" ]; then
  echo "Copying zshrc"
  cp .zshrc "$HOME/.zshrc"
fi

# Install oh-my-zsh theme
echo "Installing oh-my-zsh gruvbox theme"
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

#  Install xcode command line tools
if ! [ -x "$(command -v xcode-select)" ]; then
  echo "Installing xcode command line tools"
  xcode-select --install
fi

# Make sure nvim is setup
nvim --headless "+Lazy! sync" +qa

# Make sure tmux config is setup
tmux source-file ~/.config/tmux/tmux.conf

# Set chrome as default browser
echo "Setting chrome as default browser"
open -a "Google Chrome" --args --make-default-browser

# Install font
echo "Installing font"
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
