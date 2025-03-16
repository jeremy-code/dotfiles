# dotfiles [![License](https://img.shields.io/github/license/jeremy-code/dotfiles?logo=data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGl0bGU+Q2VydGlmaWNhdGU8L3RpdGxlPjxwYXRoIGZpbGw9IiNmZmYiIGQ9Ik00IDZ2MTRhMiAyIDAgMCAwIDIgMmgxMnY2bDMtMiAzIDJ2LTZoNGEyIDIgMCAwIDAgMi0yVjZhMiAyIDAgMCAwLTItMkg2YTIgMiAwIDAgMC0yIDJabTIgMGg4djJINlptMCA0aDZ2Mkg2Wm0wIDRoOHYySDZabTEwIDZINnYtMmgxMFptOC02djRsLTMtMi0zIDJ2LTRsLTQtMiA0LTJWNmwzIDIgMy0ydjQuMmw0IDEuOFoiLz48L3N2Zz4K)](LICENSE) [![Last Commit](https://img.shields.io/github/last-commit/jeremy-code/dotfiles?logo=git&logoColor=%23fff)](https://github.com/jeremy-code/dotfiles/commit/main)

This is my dotfiles repository. There are [many](https://dotfiles.github.io) like it, but this one is mine.

Intended for a mainly [macOS](https://www.apple.com/macos) (but also [GNU](https://www.gnu.org)/[Linux](https://www.linux.org)-compatible) development environment for [JavaScript](https://ecma-international.org/publications-and-standards/standards/ecma-262/), [TypeScript](https://www.typescriptlang.org), and other languages with various other tools, configurations, and plugins for convenience and productivity.

## Features

- [chezmoi](https://www.chezmoi.io) - Dotfiles manager
- [Homebrew](https://brew.sh) - Package manager
- [iTerm2](https://iterm2.com) - Terminal emulator
- [Oh My Zsh](https://ohmyz.sh) - `zsh` configuration framework
  - [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - fish-like autosuggestions for `zsh`
  - [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - fish-like syntax highlighting for `zsh`
- [Visual Studio Code](https://code.visualstudio.com) - Source-code editor
- [`zsh`](https://www.zsh.org) - Unix shell

## Installation

```shell
/bin/sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply jeremy-code
```

## Configuration

### chezmoi

[chezmoi](https://www.chezmoi.io) is used to manage the dotfiles in this repository. The source directory is the [`.local/share/chezmoi/home`](home) directory (declared in [`.chezmoiroot`](.chezmoiroot)) and the destination directory correspondingly is the user's home directory or `$HOME`. The other configuration files are [`home/.chezmoiignore`](home/.chezmoiignore) and [`home/.chezmoiexternal.toml`](home/.chezmoiexternal.toml.tmpl).

At the root `home/.chezmoiscripts` directory, there is currently one script: [`home/.chezmoiscripts/run_once_!mac.sh`](home/.chezmoiscripts/run_once_!mac.sh) which configures some MacOS settings that must be done imperatively.

### Homebrew

[Homebrew](https://brew.sh) is used to install Homebrew formulae and casks, macOS App Store apps, and Visual Studio Code extensions which are defined in [`home/dot_config/homebrew/Brewfile`](home/dot_config/homebrew/Brewfile) and automatically installed using [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) with the script [`home/dot_config/homebrew/run_after_Brewfile.sh.tmpl`](home/dot_config/homebrew/run_after_Brewfile.sh.tmpl).

Additional Homebrew environment variables (`$HOMEBREW_`) are defined in [`home/dot_config/homebrew/brew.env`](home/dot_config/homebrew/brew.env.tmpl).

### iTerm2

The configuration of [iTerm2](https://iterm2.com) is defined mainly in [`home/Library/Application Support/iTerm2`](<home/Library/Application Support/iTerm2>). The dynamic profile [`DynamicProfiles/profiles.json`](<home/Library/Application Support/iTerm2/DynamicProfiles/profiles.json>) has custom color schemes, theming, and other settings. The directory also contains the [`Scripts`](<home/Library/Application Support/iTerm2/Scripts>) directory for custom scripts to be used in iTerm2, such as [`Scripts/AutoLaunch/change_default_profile.py`](<home/Library/Application Support/iTerm2/Scripts/AutoLaunch/change_default_profile.py>) that sets the default profile to the aforementioned dynamic profile.

### Visual Studio Code

The configuration files of [Visual Studio Code](https://code.visualstudio.com) are stored in [`home/Library/Application Support/Code`](<home/Library/Application Support/Code>) and contains custom settings [`User/settings.json`](<home/Library/Application Support/Code/User/settings.json>), keybindings [`User/keybindings.json`](<home/Library/Application Support/Code/User/keybindings.json>), and code snippets [`User/snippets/*.json`](<home/Library/Application Support/Code/User/snippets>). It uses the [One Dark Pro Darker](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme) theme, [Fira Code](https://github.com/tonsky/FiraCode) font, and [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme). It also sets up various extensions for programming languages or library tooling ([Prettier](https://prettier.io) and [ESLint](https://eslint.org), etc.) in addition to miscellaneous utilities such as [Git Blame](https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame), [carbon-now-sh](https://marketplace.visualstudio.com/items?itemName=ericadamski.carbon-now-sh), etc.

### `zsh` and Oh My Zsh

The default shell is [`zsh`](https://www.zsh.org) using the framework [Oh My Zsh](https://ohmyz.sh). The base `zsh` configuration files [`home/dot_zshrc`](home/dot_zshrc) and [`home/dot_zprofile.tmpl`](home/dot_zprofile.tmpl) configure Oh My Zsh and set up the `$PATH` environment variable respectively.

Additional `.sh` shell scripts are stored in [`home/dot_config/oh-my-zsh`](home/dot_config/oh-my-zsh) directory (the `$ZSH_CUSTOM` directory). The files [`aliases.zsh`](home/dot_config/oh-my-zsh/aliases.zsh), [`constants.zsh`](home/dot_config/oh-my-zsh/constants.zsh), and [`telemetry.zsh`](home/dot_config/oh-my-zsh/telemetry.zsh) are sourced here. The plugins, which are installed as chezmoi external sources alongside Oh My Zsh in [`home/.chezmoiexternal.toml`](home/.chezmoiexternal.toml.tmpl) are [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) for additional `zsh` utility.

## License

This project is licensed under the [MIT license](LICENSE).
