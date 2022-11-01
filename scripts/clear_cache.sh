#!/bin/sh

. "$HOME/scripts/ui_tools.sh"

DIR=$(pwd)
cd "$HOME" || exit

log_proc "doas paccache -r" "Clearing pacman cache"
log_proc "paru --clean --noconfirm" "Clearing aur cache"

PKGS=$(pacman -Qtdq)
if [ -n "$PKGS" ]; then
  echo "$PKGS"
  log_proc "doas pacman -Rns --noconfirm $PKGS" "Removing breaked dependences"
fi

cd "$DIR" || exit
