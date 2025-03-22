# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8";
export LANGUAGE="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export EDITOR="vim"
export VISUAL="code"

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is invoked from terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)

# Set SSH authentication agent ($SSH_AUTH_SOCK) to GnuPG Secure Shell Agent's
# value. By default, it is set to "/usr/bin/ssh-agent".
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Examples.html
# https://man.openbsd.org/ssh.1#SSH_AUTH_SOCK
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Disable Open Collective postinstall scripts (https://github.com/opencollective/opencollective-postinstall)
export DISABLE_OPENCOLLECTIVE=1

# Enable verification of Docker images (https://docs.docker.com/reference/cli/docker/#environment-variables)
export DOCKER_CONTENT_TRUST=1
