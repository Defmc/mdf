#!/bin/sh

paru -Syyu --noconfirm
omz update
rustup update
~/scripts/up_config.sh
~/scripts/clear_cache.sh
doas poweroff
