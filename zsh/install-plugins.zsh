#!/usr/bin/env zsh

# Check if sheldon is installed
if [[ ! -f ~/.local/bin/sheldon ]]; then
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

test -e ~/.dircolors && \
   eval `dircolors -b ~/.dircolors`

if [[ ! -v TERM ]]; then export TERM=xterm; fi

eval "$($HOME/.local/bin/sheldon --home $HOME --config-dir $HOME/.sheldon --data-dir $HOME/.sheldon source)"
