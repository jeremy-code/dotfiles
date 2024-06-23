# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#basics
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is invoked from terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty);

# NPM
export ADBLOCK=1
export DISABLE_OPENCOLLECTIVE=1 # Disable Open Collective postinstall scripts
