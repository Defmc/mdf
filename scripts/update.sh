#!/bin/sh

doas pacman -Sy --noconfirm
rustup update
paru -Syu --noconfirm
zsh -c "$HOME/scripts/clear_cache.sh"
