# dotfiles [![License](https://img.shields.io/github/license/jeremy-code/dotfiles)](LICENSE)

These are my dotfiles. There are many like these, but these ones are mine.

Intended for a MacOS development environment development in JavaScript/TypeScript with [Homebrew](https://brew.sh/) as the package manager, [iTerm2](https://iterm2.com/) as the terminal emulator, [Visual Studio Code](https://code.visualstudio.com/) as the primary editor, and [`zsh`](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) as the primary shell.

## Features

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Homebrew](https://brew.sh/)
- [iTerm2](https://iterm2.com/)
- [Oh My Zsh](https://ohmyz.sh/)
  - [zsh-nvm](https://github.com/lukechilds/zsh-nvm)
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Visual Studio Code](https://code.visualstudio.com/)
- [`zsh`](https://www.zsh.org/)

## Installation

```bash
# Clone the repository into `~/.dotfiles`
git clone --recurse-submodules https://github.com/jeremy-code/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run initial installation script
./install.sh

# Otherwise, run the following commands manually

## Install Homebrew
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## Install Oh My Zsh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"

## Install Homebrew packages, MacOS App Store apps, and VS Code extensions
brew bundle --file ./homebrew/.Brewfile

## Activate Symlinks
stow config git homebrew zsh
stow -t "$HOME/Library/Application Support/Code/User" vscode
stow -t "$HOME/Library/Application Support/iTerm2/DynamicProfiles" iterm2

# Run extra scripts
source setup-mac.sh
source ssh.sh
```

## Configuration

### Git

The [`git`](git) directory contains `git`-related configuration files that are symlinked to `~/.config/git`:

1.  [`git/.config/git/config`](git/.config/git/config) for base Git configuration settings (name, email, etc.) and to set VS Code as default editor, diff tool, and merge tool.
2.  [`git/.config/git/ignore`](git/.config/git/ignore) for global Git ignore rules.

### GNU Stow

The directories [`config`](config), [`git`](git), [`homebrew`](homebrew) are symlinked to home directory (`~` or `$HOME`).

[`vscode`](vscode) and [`iterm2`](iterm2) are symlinked to their respective directories `Code/User` and `iTerm2/DynamicProfiles` in `~/Library/Application Support`.

### Homebrew

[Homebrew](https://brew.sh/) is used to install Homebrew formulae and casks, MacOS App Store apps, and Visual Studio Code extensions. The list of packages and apps are defined in the [`homebrew/.Brewfile`](homebrew/.Brewfile), which is symlinked to `~/.Brewfile`. After installing and running `stow`, installation can be done with `brew bundle --global`.

Miscellaneous Homebrew environment variables are defined in [`homebrew/.homebrew/brew.env`](homebrew/.homebrew/brew.env), which is symlinked to `~/.homebrew/brew.env`.

### iTerm2

The [`iterm2`](iterm2) directory contains the iTerm2 dynamic profile configuration file [`DynamicProfiles/profiles.json`](iterm2/DynamicProfiles/profiles.json) for custom color schemes, theming, and other settings, which is symlinked to `~/Library/Application Support/iTerm2/DynamicProfiles`. It also contains the [`Scripts`](iterm2/Scripts) directory for custom scripts to be used in iTerm2, such as setting the default profile to the aforementioned dynamic profile in [`Scripts/AutoLaunch/change_default_profile.py`](iterm2/Scripts/AutoLaunch/change_default_profile.py).

### Visual Studio Code

The [`vscode`](vscode) directory contains the Visual Studio Code settings file [`settings.json`](vscode/settings.json) for custom settings, and snippets files [`snippets/*.json`](vscode/snippets) for custom code snippets. It uses [`One Dark Pro Darker`](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme) theme, [`Fira Code`](https://github.com/tonsky/FiraCode) font, and [`Material Icon Theme`](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) icon theme. It also sets up various extensions for language/library tooling ([Prettier](https://prettier.io/), [ESLint](https://eslint.org/), etc.) and miscellaneous utilities ([Git Blame](https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame), [Carbon](https://marketplace.visualstudio.com/items?itemName=ericadamski.carbon-now-sh), etc.).

### `zsh` and Oh My Zsh

The default shell is `zsh` using the framework [Oh My Zsh](https://ohmyz.sh/). Base `zsh` configuration files are located in the [`zsh`](zsh) directory, which set up `PATH` and Oh My Zsh.

Additional configuration is in [`oh-my-zsh`](oh-my-zsh) directory (the `ZSH_CUSTOM` directory for Oh My Zsh). The files [`aliases.zsh`](oh-my-zsh/aliases.zsh), [`constants.zsh`](oh-my-zsh/constants.zsh), [`telemetry.zsh`](oh-my-zsh/telemetry.zsh) are sourced here. The plugins, which are installed as Git submodules, are [`zsh-autosuggestions`](oh-my-zsh/plugins/zsh-autosuggestions/) and [`zsh-syntax-highlighting`](oh-my-zsh/plugins/zsh-syntax-highlighting/) for `zsh` utilities and [`zsh-nvm`](oh-my-zsh/plugins/zsh-nvm/) to automatically install and load `nvm`.

### Config

The [`config`](config) directory contains miscellaneous configuration files, namely:

1. [`.npmrc`](config/.npmrc) for NPM configuration settings
2. [`.editorconfig`](config/.editorconfig) for [EditorConfig](https://editorconfig.org/) settings (matching [Prettier's defaults](https://prettier.io/docs/en/configuration#editorconfig))
3. [`.gnupg`](config/.gnupg) for GPG signing with the pinentry program [`pinentry-mac`](https://github.com/GPGTools/pinentry).

## License

This project is licensed under the [MIT license](LICENSE).
