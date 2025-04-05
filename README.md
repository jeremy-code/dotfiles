# dotfiles [![License](https://img.shields.io/github/license/jeremy-code/dotfiles?logo=data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGl0bGU+Q2VydGlmaWNhdGU8L3RpdGxlPjxwYXRoIGZpbGw9IiNmZmYiIGQ9Ik00IDZ2MTRhMiAyIDAgMCAwIDIgMmgxMnY2bDMtMiAzIDJ2LTZoNGEyIDIgMCAwIDAgMi0yVjZhMiAyIDAgMCAwLTItMkg2YTIgMiAwIDAgMC0yIDJabTIgMGg4djJINlptMCA0aDZ2Mkg2Wm0wIDRoOHYySDZabTEwIDZINnYtMmgxMFptOC02djRsLTMtMi0zIDJ2LTRsLTQtMiA0LTJWNmwzIDIgMy0ydjQuMmw0IDEuOFoiLz48L3N2Zz4K)](LICENSE) [![Last Commit](https://img.shields.io/github/last-commit/jeremy-code/dotfiles?logo=git&logoColor=%23fff)](https://github.com/jeremy-code/dotfiles/commit/main)

This is my dotfiles repository. There are [many](https://dotfiles.github.io) like it, but this one is mine.

Intended to be a mainly [macOS](https://www.apple.com/macos) (but also [GNU](https://www.gnu.org)/[Linux](https://www.linux.org)-compatible) development environment for coding in [JavaScript](https://ecma-international.org/publications-and-standards/standards/ecma-262/), [TypeScript](https://www.typescriptlang.org), [Python](https://www.python.org/), and other languages with various other tools, configurations, and plugins for convenience and productivity.

## Features

- [chezmoi](https://www.chezmoi.io) - Dotfiles manager
- [Homebrew](https://brew.sh) - Package manager
  - [`brew bundle`](https://docs.brew.sh/Brew-Bundle-and-Brewfile) - Bundler for Homebrew, Homebrew Cask, [Mac App Store](https://www.apple.com/app-store/) and Visual Studio Code
- [iTerm2](https://iterm2.com) - Terminal emulator
- [Oh My Zsh](https://ohmyz.sh) - `zsh` configuration framework
  - [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages) - Adds colors to man pages
  - [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) - Many git aliases and a few useful functions
  - [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like fast/unobtrusive autosuggestions for `zsh`
  - [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Fish shell-like syntax highlighting for Zsh
- [Visual Studio Code](https://code.visualstudio.com) - Source-code editor
- [`zsh`](https://www.zsh.org) - Unix shell

## Installation

Using a chezmoi-first approach:

```shell
/bin/sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply jeremy-code
brew install chezmoi --adopt
```

Otherwise, with a Homebrew-first approach (see [`run_once_install_00-homebrew.sh`](home/.chezmoiscripts/run_once_00-install_homebrew.sh) for more details):

```shell
# Install Homebrew with either the signed-.pkg file at Homebrew's GitHub
# releases https://github.com/Homebrew/brew/releases/latest or run the script
# from https://github.com/Homebrew/install using:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install chezmoi
chezmoi init jeremy-code --apply
```

Ideally, inspect either shell script before running them to ensure they are safe to run. This will be the easiest attack vector since afterwards, packages installed in [`homebrew-core`](https://github.com/Homebrew/homebrew-core) will be verified using cryptographic attestations of build provenance due to the enabled `$HOMEBREW_VERIFY_ATTESTATIONS` environment variable in [`home/dot_config/homebrew/brew.env.tmpl`](home/dot_config/homebrew/brew.env.tmpl) (see [Homebrew](#homebrew) for more details).

## Configuration

### chezmoi

[chezmoi](https://www.chezmoi.io) is used to manage the dotfiles in this repository. The source directory is the [`$HOME/.local/share/chezmoi/home`](home) directory (declared in [`.chezmoiroot`](.chezmoiroot)) and the destination directory is correspondingly the user's home directory or `$HOME`. The other configuration files are stored in the source directory, such as [`home/.chezmoiexternal.toml`](home/.chezmoiexternal.toml).

Additional root scripts are located in the [`home/.chezmoiscripts`](home/.chezmoiscripts) directory. These scripts are intended to be indempotent (can be run multiple times without altering the whole system). Since chezmoi runs scripts in ASCII-defined order, the scripts are prefixed with a two-digit number `XX-` to define the order in which they are run if it is relevant, a convention used commonly in Debian-based system using [`run-parts`](https://manpages.debian.org/testing/debianutils/run-parts.8.html) or those inspired by Unix System V `init` design (see [sysvinit/debian](https://salsa.debian.org/debian/sysvinit/-/blob/master/debian/src/sysv-rc/doc/README.runlevels)).

- [`run_once_00-install_homebrew.sh`](home/.chezmoiscripts/run_once_00-install_homebrew.sh) - Installs Homebrew for the first time either using the signed-`.pkg` file for MacOS or running a Bash installation shell script for Linux
- [`run_once_40-mac.sh`](home/.chezmoiscripts/run_once_40-mac.sh) - Configures some macOS settings that must be done imperatively (namely using the `defaults` to configure `.plist` files). Some assets needed for this script are located in the [`$HOME/.local/share/chezmoi/assets`](assets) directory in the source directory
- [`run_once_dato.sh.tmpl`](home/.chezmoiscripts/run_once_dato.sh.tmpl) - Configures some settings for the [Dato](https://sindresorhus.com/dato) app, which must be a `.tmpl` file due to containing some JSON data stored in the [`home/.chezmoidata/dato.json`](home/.chezmoidata/dato.json) file
- [`run_once_latex.sh`](home/.chezmoiscripts/run_once_latex.sh) - Self-updates [`tlmgr`](https://www.tug.org/texlive/tlmgr.html) and installs the LaTeX packages defined in the array `PACKAGES`
- [`run_once_update_gpg.sh.tmpl`](home/.chezmoiscripts/run_once_update_gpg.sh.tmpl) - Updates the GPG key expiration date to 1 year from the current date if the key is set to expire within 6 months

### Homebrew

[Homebrew](https://brew.sh) is used to install Homebrew formulae and casks, Mac App Store apps, and Visual Studio Code extensions. Configuration is stored in the [`home/dot_config/homebrew`](home/dot_config/homebrew) directory.

- The `brew bundle` dependencies are defined in the [`Brewfile`](home/dot_config/homebrew/Brewfile) file
- When the aforementioned file is updated, `brew bundle install` is automatically ran with the script [`run_once_after_Brewfile.sh.tmpl`](home/dot_config/homebrew/run_once_after_Brewfile.sh.tmpl)
- The [`brew.env.tmpl`](home/dot_config/homebrew/brew.env.tmpl) file defines additional Homebrew environment variables (`$HOMEBREW_*`)

### iTerm2

The configuration of [iTerm2](https://iterm2.com) is defined mainly in [`home/Library/Application Support/iTerm2`](<home/Library/Application Support/iTerm2>). The dynamic profile [`DynamicProfiles/profiles.json`](<home/Library/Application Support/iTerm2/DynamicProfiles/profiles.json>) has custom color schemes, theming, and other settings. The directory also contains the [`Scripts`](<home/Library/Application Support/iTerm2/Scripts>) directory for custom scripts to be used in iTerm2, such as [`Scripts/AutoLaunch/change_default_profile.py`](<home/Library/Application Support/iTerm2/Scripts/AutoLaunch/change_default_profile.py>) which sets the default profile to the aforementioned dynamic profile on launch.

Some additional configuration is installed in [`home/.chezmoiscripts/run_once_40-mac.sh`](home/.chezmoiscripts/run_once_40-mac.sh#L125-L153) to set non-profile settings.

### Visual Studio Code

The configuration files of [Visual Studio Code](https://code.visualstudio.com) are stored in [`home/Library/Application Support/Code`](<home/Library/Application Support/Code>) and contains custom settings [`User/settings.json`](<home/Library/Application Support/Code/User/settings.json>), keybindings [`User/keybindings.json`](<home/Library/Application Support/Code/User/keybindings.json>), and code snippets [`User/snippets/*.json`](<home/Library/Application Support/Code/User/snippets>). It uses the [One Dark Pro Darker](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme) theme, [Fira Code](https://github.com/tonsky/FiraCode) font, and [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme). It also sets up various extensions for programming languages or library tooling ([Prettier](https://prettier.io) and [ESLint](https://eslint.org), etc.) in addition to miscellaneous utilities such as [Git Blame](https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame), [carbon-now-sh](https://marketplace.visualstudio.com/items?itemName=ericadamski.carbon-now-sh), etc.

### `zsh` and Oh My Zsh

The default shell is [`zsh`](https://www.zsh.org) using the framework [Oh My Zsh](https://ohmyz.sh). The base `zsh` configuration files [`home/dot_zshrc`](home/dot_zshrc) and [`home/dot_zprofile.tmpl`](home/dot_zprofile.tmpl) configure Oh My Zsh and set up some necessary startup environment variables respectively. Shell scripts attempt to follow the [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html) as closely as possible.

Additional `.sh` shell scripts are stored in [`home/dot_config/oh-my-zsh`](home/dot_config/oh-my-zsh) directory (the `$ZSH_CUSTOM` directory) which contains:

- [`aliases.zsh`](home/dot_config/oh-my-zsh/aliases.zsh) - Enables custom command aliases, suffix aliases (`.zip`, `.git`), and named directories (`~github` and `~dotfiles`)
- [`constants.zsh`](home/dot_config/oh-my-zsh/constants.zsh) - Sets custom constants for the shell environment
- [`telemetry.zsh`](home/dot_config/oh-my-zsh/telemetry.zsh) - Sets environment variables to disable telemetry and analytics for various applications

Furthermore, this directory contains a [functions](home/dot_config/oh-my-zsh/functions) directory for additional functions for `zsh` that are [autoloaded](https://zsh.sourceforge.io/Doc/Release/Functions.html#index-autoloading-functions) in the aforementioned `home/dot_zprofile.tmpl` file.

The plugins [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) and [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages) are bundled with Oh My Zsh and are enabled in the `.zshrc` file. Additionally, the external plugins [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) are installed to the corresponding `$ZSH_CUSTOM/plugins` directory. These external plugins along Oh My Zsh are defined in [`home/.chezmoiexternal.toml`](home/.chezmoiexternal.toml) as external Git repositories to be installed by chezmoi.

## License

This project is licensed under the [MIT license](LICENSE).
