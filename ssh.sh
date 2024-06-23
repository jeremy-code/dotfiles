#!/usr/bin/env zsh

# Generate SSH key if it doesn't already exist
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "Generating SSH key..."
  ssh-keygen -t ed25519 -C "$(git config user.email)" -f ~/.ssh/id_ed25519
else
  echo "SSH key already exists."
fi

# Start the ssh-agent
eval "$(ssh-agent -s)"

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

if ! gh auth status -h github.com &> /dev/null; then
  echo "Please authenticate with GitHub CLI first using 'gh auth login'."
  exit 1
fi

gh auth refresh -h github.com -s admin:public_key
gh ssh-key add ~/.ssh/id_ed25519.pub --type authentication
