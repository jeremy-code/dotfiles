# While typically zsh recommends storing environment variables such as `PATH` in
# `.zshenv`, in MacOS, in `/etc/zprofile`, the `path_helper` utility which sets
# `PATH` is called. Hence, it is necessary to set `PATH` in a zsh configuration
# file that is sourced after `/etc/zprofile`, often `.zshrc` (interactive) or
# `.zprofile` (login).
#
# x-man-page://path_helper
# https://opensource.apple.com/source/shell_cmds/shell_cmds-149/path_helper/path_helper.8.auto.html
# https://zsh.sourceforge.io/Doc/Release/Files.html -- Startup/Shutdown Files

# Default Homebrew installation paths for macOS and Linux
# https://docs.brew.sh/FAQ#why-should-i-install-homebrew-in-the-default-location
BREW_PATHS=(
  "/opt/homebrew/bin/brew"               # macOS M1
  "/usr/local/bin/brew"                  # macOS Intel
  "/home/linuxbrew/.linuxbrew/bin/brew"  # Linux
)

for homebrew_path in "${BREW_PATHS[@]}"; do
  if [ -e "$homebrew_path" ]; then
    # Add Homebrew to PATH, MANPATH, INFOPATH and export Homebrew variables
    # https://docs.brew.sh/Manpage#shellenv-bashcshfishpwshshtcshzsh
    source <($homebrew_path shellenv)
    break
  fi
done

# Setting `PATH` variable in zsh with `$path` array
# https://zsh.sourceforge.io/Guide/zshguide02.html#l24

# Remove duplicate entries in `$path` and `$fpath`
typeset -U path fpath

path=(
  $(brew --prefix python)/libexec/bin # Enable unversioned symlinks for Python, python-config, pip, etc.
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions # Homebrew completions
  $fpath
)

export EDITOR="vim"
export VISUAL="code"
