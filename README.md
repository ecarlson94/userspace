# Bring Your Own Userspace (BYOB) [![Publish Docker Image](https://github.com/ecarlson94/userspace/actions/workflows/publish-docker-image.yml/badge.svg)](https://github.com/ecarlson94/userspace/actions/workflows/publish-docker-image.yml)
Dotfile & dev environment dependency management using [Dotbot](https://github.com/anishathalye/dotbot) and [Docker](https://www.docker.com/).

Quick uptime with containerized dotfiles and minimal dependency installation on host.
Most dependencies exist in the [ecarlson94/userspace](https://github.com/users/ecarlson94/packages/container/package/userspace) container image and the container
is executed like a binary through [shims links](./meta/configs/shims.yaml) (currently only a [zsh wrapper](./shims/zsh.sh) around [shim.sh](./shims/shim.sh) is needed).

If you want to view the dotfiles used within the container, please review [ecarlson94/dotfiles](https://github.com/ecarlson94/dotfiles).

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Table of Contents

<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
  - [For installing a predefined profile:](#for-installing-a-predefined-profile)
  - [For installing single configurations:](#for-installing-single-configurations)
  - [Post-Installation](#post-installation)
    - [Mac or Ubuntu Desktop](#mac-or-ubuntu-desktop)
    - [WSL or headless linux](#wsl-or-headless-linux)
  - [Acquiring the latest image](#acquiring-the-latest-image)
- [Contents](#contents)
  - [Profiles](#profiles)
- [License](#license)

<!-- TOC -->

## Dependencies
- git
- docker (automatically installed)

## Installation
```bash
~$ git clone --recursive https://github.com/ecarlson94/userspace.git ~/.userspace
~$ cd ~/.userspace
```

### For installing a predefined profile:
```bash
~/.userpsace$ ./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles

### For installing single configurations:
```bash
~/.userpsace$ ./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

### Post-Installation
You can run the above installation commands safely multiple times, if you think that helps with better installation.

#### Mac or Ubuntu Desktop
1. Exit terminal
1. Start Alacritty

#### WSL or headless linux
1. Restart terminal
1. Run `zsh`
1. (WSL) Run `compaudit | xargs chmod go-w`

### Acquiring the latest image
1. Quit Alacritty
1. Open terminal
1. Run `docker rmi ghcr.io/ecarlson94/userspace:main`
1. Reopen Alacritty

## Contents

### Profiles
<pre>
meta/profiles
├── <a href="./meta/profiles/garuda-linux" title="garuda-linux">garuda-linux</a>
├── <a href="./meta/profiles/kde-sweet" title="kde-sweet">kde-sweet</a>
├── <a href="./meta/profiles/kubuntu" title="kubuntu">kubuntu</a>
├── <a href="./meta/profiles/mac" title="mac">mac</a>
├── <a href="./meta/profiles/ubuntu" title="ubuntu">ubuntu</a>
└── <a href="./meta/profiles/ubuntu-desktop" title="ubuntu-desktop">ubuntu-desktop</a>
</pre>

## License
This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
