#!/usr/bin/env zsh

echo "Starting setup..."

# Check for Homebrew and install if it doesn't exist
if ! type brew > /dev/null; then
  echo "Installing Homebrew..."
  if /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo "Homebrew installed successfully!"
  else
    echo "Failed to install Homebrew."
    exit 1
  fi
fi

# Run Oh My Zsh install script
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install dependencies with Homebrew bundle (See file://./homebrew/.Brewfile)
brew bundle --file ./homebrew/.Brewfile

# Activate symlinks
echo "Activating symlinks..."
stow config git homebrew zsh

APPLICATION_SUPPORT="$HOME/Library/Application Support"
stow -t $APPLICATION_SUPPORT/Code/User vscode
stow -t $APPLICATION_SUPPORT/iTerm2/DynamicProfiles iterm2
echo "Symlinks activated successfully!"
