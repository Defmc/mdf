#!/bin/sh

cd ~/dev/unfoback
deno run --allow-all app.js
paru -Syyu --noconfirm
omz update
rustup update
~/scripts/up_config.sh
~/scripts/clear_cache.sh
