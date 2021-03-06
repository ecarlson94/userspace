FROM ruby:alpine
MAINTAINER Eric Carlson
LABEL maintainer "Eric Carlson <e.carlson94@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/ecarlson94/userspace

ARG user=walawren
ARG group=wheel
ARG uid=1000
ARG dotfiles=dotfiles.git
ARG userspace=userspace.git
ARG vcsprovider=github.com
ARG vcsowner=ecarlson94
ARG azurecliversion=2.26.1

USER root

ENV PYTHONUNBUFFERED=1

RUN \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories \
    && apk upgrade --no-cache \
    && apk add --update --no-cache \
        sudo \
        autoconf \
        libtool \
        automake \
        ncurses \
        nasm \
        ca-certificates \
        libressl \
        git git-doc \
        python3 \
        python3-dev \
        py3-pip \
        perl \
        openssh \
        openssl \
        bash \
        bash-completion \
        curl \
        cmake \
        ctags \
        file \
        curl \
        build-base \
        gcc \
        coreutils \
        wget \
        gnupg-scdaemon \
        pcsc-lite \
        gnupg \
        npm \
        neovim \
        zsh \
        fontconfig \
        ripgrep \
        tar \
        terraform \
        tmux \
        docker \
        docker-compose \
        less \
        go \
        mongodb \
        jq \
        yaml-cpp=0.6.2-r2 \
    && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && npm install -g yarn

# Install Azure Stuff
RUN pip3 install --upgrade azure-cli

# Create user to run commands as
RUN \
    echo "%${group} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && adduser -D -G ${group} ${user} \
    && addgroup ${user} docker

COPY ./ /home/${user}/.userspace/
RUN \
    git clone --recursive https://${vcsprovider}/${vcsowner}/${dotfiles} /home/${user}/.dotfiles \
    && chown -R ${user}:${group} /home/${user}/.dotfiles \
    && cd /home/${user}/.dotfiles \
    && git remote set-url origin git@${vcsprovider}:${vcsowner}/${dotfiles} \
    && chown -R ${user}:${group} /home/${user}/.userspace \
    && cd /home/${user}/.userspace \
    && git remote set-url origin git@${vcsprovider}:${vcsowner}/${userspace}

USER ${user}
ARG ghVersion=1.7.0
RUN \
    cd $HOME/.dotfiles \
    && ./install-profile linux \
    && cd $HOME/.userspace \
    && if [ ! -d ~/.fzf ]; then git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; fi && ~/.fzf/install --key-bindings --completion --no-update-rc \
    && gem install tmuxinator \
    && go get -u github.com/boyter/scc/ \
    && wget -O ./ghcli.tar.gz https://github.com/cli/cli/releases/download/v${ghVersion}/gh_${ghVersion}_linux_amd64.tar.gz \
    && mkdir ghcli \
    && tar -xvf ghcli.tar.gz -C ./ghcli \
    && sudo cp ghcli/gh_${ghVersion}_linux_amd64/bin/gh /usr/bin \
    && rm -rf ghcli \
    && rm ghcli.tar.gz \
    && ./install-standalone \
        zsh-dependencies \
        zsh-plugins \
        nvim-dependencies \
        gnupg-configure

# Save cmd history to host machine
ENV HISTFILE=/config/.zsh_history
ENV MONGOMS_SYSTEM_BINARY=/usr/bin/mongod

CMD [ ]
