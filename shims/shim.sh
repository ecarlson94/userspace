#!/bin/bash

eval $(which ssh-agent)
export TTY=$(tty)
export GPG_TTY=$TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null
gpgconf --launch gpg-agent

docker run -it --rm \
  --privileged \
  -v $HOME/Documents:/Documents:rw \
  -w $HOME \
  -v $HOME/.dotfiles:/dotfiles:rw \
  -v $PWD:/cwd:rw \
  -v $HOME/.config:/config:rw \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${HOME}/.gnupg/:/.gnupg/:ro \
  -v /run/user/$(id -u)/:/run/user/$(id -u)/:ro \
  -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
  -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
  -p 1234:1234 \
  -p 3000:3000 \
  -p 5000:5000 \
  -u `id -u` \
  ghcr.io/ecarlson94/userspace:main "$@"
