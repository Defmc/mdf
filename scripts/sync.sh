#!/bin/sh

rm -rf "$HOME/dev/mdf"
git clone https://github.com/Defmc/mdf "$HOME/dev/mdf"

for p in $(exa --all "$HOME/dev/mdf"); do
  if [ "$p" != "." ] && [ "$p" != ".." ]; then
    rm -rf "$HOME/${p:?}"
    cp -r "$HOME/dev/mdf/$p" "$HOME/$p"
  fi
done
