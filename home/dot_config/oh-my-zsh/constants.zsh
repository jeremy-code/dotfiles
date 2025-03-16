# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8";
export LANGUAGE="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export EDITOR="vim"
export VISUAL="code"

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is invoked from terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
# https://www.gnupg.org/documentation/manuals/gnupg/Common-Problems.html
export GPG_TTY=$(tty);

# Disable Open Collective postinstall scripts (https://github.com/opencollective/opencollective-postinstall)
export DISABLE_OPENCOLLECTIVE=1
