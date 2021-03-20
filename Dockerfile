FROM ruby:alpine
MAINTAINER Eric Carlson
LABEL maintainer "Eric Carlson <e.carlson94@gmail.com>"

ARG user=walawren
ARG group=wheel
ARG uid=1000

USER root

RUN \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk upgrade --no-cache && \
    apk add --update --no-cache \
        sudo \
        ncurses \
        ca-certificates \
        libressl \
        git git-doc \
        python3 \
        python3-dev \
        py3-pip \
        perl \
        openssh \
        bash \
        bash-completion \
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
        yarn \
        neovim \
        zsh \
        fontconfig \
        ripgrep \
        tmux \
        docker \
        docker-compose \
        less \
        go

RUN \
    echo "%${group} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    adduser -D -G ${group} ${user} && \
    addgroup ${user} docker

COPY ./ /home/${user}/.dotfiles/
RUN \
    chown -R ${user}:${group} /home/${user}/.dotfiles && \
    cd /home/${user}/.dotfiles

USER ${user}
ARG ghVersion=1.7.0
RUN \
    cd $HOME/.dotfiles && \
    if [ ! -d ~/.fzf ]; then git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; fi && ~/.fzf/install --key-bindings --completion --no-update-rc && \
    gem install tmuxinator && \
    sudo go get -u github.com/boyter/scc/ && \
    wget -O ./ghcli.tar.gz https://github.com/cli/cli/releases/download/v${ghVersion}/gh_${ghVersion}_linux_amd64.tar.gz && \
    mkdir ghcli && \
    tar -xvf ghcli.tar.gz -C ./ghcli && \
    sudo cp ghcli/gh_${ghVersion}_linux_amd64/bin/gh /usr/bin && \
    rm -rf ghcli && \
    rm ghcli.tar.gz && \
    ./install-standalone \
        github \
        git \
        dir-colors \
        zsh \
        tmux \
        tmuxinator \
        vim \
        gnupg \
        zsh-dependencies \
        zsh-plugins \
        vim-dependencies \
        vim-plugins \
        tmux-plugins \
        gnupg-configure

ENV HISTFILE=/config/.zsh_history

CMD [ "zsh" ]
