DEPRECATED in favor of using [Devbox](https://github.com/ecarlson94/devbox).

# Bring Your Own Userspace (BYOB)
Dotfile & dev environment dependency management using [Dotbot](https://github.com/anishathalye/dotbot).

Quick uptime with containerized dotfiles and automated dependency installation on host.

If you want to view the dotfiles used within the container, please review [ecarlson94/dotfiles](https://github.com/ecarlson94/dotfiles).

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Table of Contents

<!-- TOC GFM -->

- [Bring Your Own Userspace (BYOB)](#bring-your-own-userspace-byob)
  - [Table of Contents](#table-of-contents)
  - [Dependencies](#dependencies)
  - [Installation](#installation)
    - [For installing a predefined profile:](#for-installing-a-predefined-profile)
    - [For installing single configurations:](#for-installing-single-configurations)
    - [Post-Installation](#post-installation)
      - [Mac or Ubuntu Desktop](#mac-or-ubuntu-desktop)
      - [WSL or headless linux](#wsl-or-headless-linux)
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

## Contents

### Profiles
<pre>
meta/profiles
├── <a href="./meta/profiles/devcontainer" title="devcontainer">devcontainer</a>
└── <a href="./meta/profiles/mac" title="mac">mac</a>
</pre>

## License
This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
