# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="vim"
export VISUAL="code"

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is invoked from terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY="${TTY}"

# Set SSH authentication agent ($SSH_AUTH_SOCK) to GnuPG Secure Shell Agent's
# socket. By default, it is set to "/usr/bin/ssh-agent"
#
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Examples.html
# https://man.openbsd.org/ssh.1#SSH_AUTH_SOCK
# https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;f=agent/gpg-agent.c;hb=HEAD#l1725
unset SSH_AGENT_PID

# Note that while on zsh, SSH_AUTH_SOCK will NOT be overwritten when running
# `gpg-agent --daemon /bin/zsh`, it will be overwritten when running it on other
# shells since this script is only sourced in zsh
if [[ "${gnupg_SSH_AUTH_SOCK_by:-0}" != $$ ]]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)" # "${HOME}/.gnupg/S.gpg-agent.ssh"
fi

# Disable Open Collective postinstall scripts (https://github.com/opencollective/opencollective-postinstall)
export DISABLE_OPENCOLLECTIVE=1

# Enable verification of Docker images (https://docs.docker.com/reference/cli/docker/#environment-variables)
export DOCKER_CONTENT_TRUST=1
