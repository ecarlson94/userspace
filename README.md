# Dotfiles
Dotfile management using [Dotbot](https://github.com/anishathalye/dotbot) and [Docker](https://www.docker.com/).

Quick uptime with containerized dotfiles and minimal dependency installation on host.
Most dependencies exist in the [walawren/dotfiles](https://hub.docker.com/r/walawren/dotfiles) container image and the container
is executed like a binary through [shims links](./meta/configs/shims.yaml) (currently only [zsh](./shims/zsh.sh) entrypoint is needed).

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
    - [For installing a predefined profile:](#for-installing-a-predefined-profile)
        - [Set global git user name and email](#set-global-git-user-name-and-email)
    - [For installing single configurations:](#for-installing-single-configurations)
    - [Post-Installation](#post-installation)
- [Contents](#contents)
    - [Profiles](#profiles)
    - [Configs](#configs)
- [License](#license)

<!-- /TOC -->

## Dependencies
- git
- docker (automatically installed)

## Installation

```bash
~$ git clone --recursive git@github.com:ecarlson94/dotfiles.git ~/.dotfiles
~$ cd ~/.dotfiles
```

### For installing a predefined profile:

```bash
~/.dotfiles$ ./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles


#### Set global git user name and email

```bash
~/.dotfiles$ ./install-profile <profile> git-override
```

### For installing single configurations:

```bash
~/.dotfiles$ ./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

### Post-Installation
You can run the above installation commands safely multiple times, if you think that helps with better installation.

1. Restart terminal
1. (WSL) Run `compaudit | xargs chmod go-w`

## Contents

### Profiles
<pre>
meta/profiles
├── <a href="./meta/profiles/mac" title="mac">mac</a>
├── <a href="./meta/profiles/ubuntu" title="ubuntu">ubuntu</a>
└── <a href="./meta/profiles/ubuntu-desktop" title="ubuntu-desktop">ubuntu-desktop</a>
</pre>

### Configs
<pre>
meta
├── <a href="./meta/base.yaml" title="base.yaml">base.yaml</a>
└── configs
    ├── <a href="./meta/configs/alacritty-cargo.yaml" title="alacritty-cargo.yaml">alacritty-cargo.yaml</a>
    ├── <a href="./meta/configs/alacritty-ubuntu-deps.yaml" title="alacritty-ubuntu-deps.yaml">alacritty-ubuntu-deps.yaml</a>
    ├── <a href="./meta/configs/alacritty.yaml" title="alacritty.yaml">alacritty.yaml</a>
    ├── <a href="./meta/configs/apt.yaml" title="apt.yaml">apt.yaml</a>
    ├── <a href="./meta/configs/bash.yaml" title="bash.yaml">bash.yaml</a>
    ├── <a href="./meta/configs/dir-colors.yaml" title="dir-colors.yaml">dir-colors.yaml</a>
    ├── <a href="./meta/configs/dotfiles-container.yaml" title="dotfiles-container.yaml">dotfiles-container.yaml</a>
    ├── <a href="./meta/configs/fonts-linux.yaml" title="fonts-linux.yaml">fonts-linux.yaml</a>
    ├── <a href="./meta/configs/fonts-mac.yaml" title="fonts-mac.yaml">fonts-mac.yaml</a>
    ├── <a href="./meta/configs/git-override.yaml" title="git-override.yaml">git-override.yaml</a> (Allows setting user.name and user.email)
    ├── <a href="./meta/configs/git.yaml" title="git.yaml">git.yaml</a>
    ├── <a href="./meta/configs/github.yaml" title="github.yaml">github.yaml</a>
    ├── <a href="./meta/configs/gnupg.yaml" title="gnupg.yaml">gnupg.yaml</a>
    ├── <a href="./meta/configs/gnupg-mac.yaml" title="gnupg-mac.yaml">gnupg-mac.yaml</a>
    ├── <a href="./meta/configs/gnupg-configure.yaml" title="gnupg-configure.yaml">gnupg-configure.yaml</a>
    ├── <a href="./meta/configs/homebrew.yaml" title="homebrew.yaml">homebrew.yaml</a>
    ├── <a href="./meta/configs/shims.yaml" title="shims.yaml">shims.yaml</a>
    ├── <a href="./meta/configs/ubuntu-desktop.yaml" title="ubuntu-desktop.yaml">ubuntu-desktop.yaml</a> (contains packages that are gui based)
    ├── <a href="./meta/configs/tmux.yaml" title="tmux.yaml">tmux.yaml</a>
    ├── <a href="./meta/configs/tmuxinator.yaml" title="tmuxinator.yaml">tmuxinator.yaml</a>
    ├── <a href="./meta/configs/tmux-plugins.yaml" title="tmux-plugins.yaml">tmux-plugins.yaml</a>
    ├── <a href="./meta/configs/vim-dependencies.yaml" title="vim-dependencies.yaml">vim-dependencies.yaml</a>
    ├── <a href="./meta/configs/vim-plugins.yaml" title="vim-plugins.yaml">vim-plugins.yaml</a>
    ├── <a href="./meta/configs/vim.yaml" title="vim.yaml">vim.yaml</a>
    ├── <a href="./meta/configs/zsh-dependencies.yaml" title="zsh-dependencies.yaml">zsh-dependencies.yaml</a>
    ├── <a href="./meta/configs/zsh-plugins.yaml" title="zsh-plugins.yaml">zsh-plugins.yaml</a>
    └── <a href="./meta/configs/zsh.yaml" title="zsh.yaml">zsh.yaml</a>
</pre>

## License
This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
