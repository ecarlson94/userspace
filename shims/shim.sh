#!/bin/bash

# SSH Passthrough Setup
eval $(which ssh-agent)
export TTY=$(tty)
export GPG_TTY=$TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null
gpgconf --launch gpg-agent
# Identity Card unlock
ssh git@github.com

# Userspace Command
docker run -it --rm \
  --privileged \
  -v $HOME/Documents:/Documents:rw \
  -w $HOME \
  -v $PWD:/cwd:rw \
  -v $HOME/.config:/config:rw \
  # Docker sock passthrough
  -v /var/run/docker.sock:/var/run/docker.sock \
  # SSH Configuration
  -v ${HOME}/.gnupg/:/.gnupg/:ro \
  -v /run/user/$(id -u)/:/run/user/$(id -u)/:ro \
  -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
  -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
  -u `id -u` \
  --network host \
  ghcr.io/ecarlson94/userspace:main "$@"
