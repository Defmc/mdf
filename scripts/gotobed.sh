#!/bin/sh

. /etc/os-release

cd ~/dev/unfoback
deno run --allow-all app.js

case "$NAME" in
    "Void") xbps-install -Su -y ;;
    "Arch") paru -Syyu --noconfirm ;;
esac

~/.oh-my-zsh/tools/upgrade.sh
rustup update
~/scripts/up_config.sh
