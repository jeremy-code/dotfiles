# Installation

## Install

```sh
/bin/sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply jeremy-code
PATH="$HOME/.local/bin:$PATH"
chezmoi apply --keep-going
```

## Set up Bitwarden CLI

```sh
# Set Bitwarden server
bw config server bitwarden.com
# Login, set BW_SESSION in environment
bw login
```
