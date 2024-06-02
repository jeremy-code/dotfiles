#!/bin/sh

echo "Starting setup..."

# Set Zsh as default shell
chsh -s `which zsh`

# Check for Homebrew and install if it doesn't exist
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for Oh My Zsh and install if it doesn't exist
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended
fi

# Install all our dependencies with bundle (See file://./Brewfile)
brew bundle --file ./Brewfile

# Activate symlinks
stow config git zsh
stow -t "$HOME/Library/Application Support/Code/User" vscode
