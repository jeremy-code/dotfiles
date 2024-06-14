# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is displayed in terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty);

# NPM
export ADBLOCK=1
export DISABLE_OPENCOLLECTIVE=1 # Disable Open Collective postinstall scripts
