#!/bin/sh

~/scripts/set_time2online.sh
cd ~/dev/unfoback
deno run --allow-all app.js
paru -Syyu --noconfirm
stack upgrade
zsh -c "source ~/.zshrc && omz update && exit"
rustup update
~/scripts/up_config.sh
~/scripts/clear_cache.sh
