#!/bin/sh

LIST="cargo-expand cargo-udeps cargo-audit cargo-bloat cargo-watch cargo-nextest loc stylua cargo-edit cargo-spellcheck"

cargo uninstall "$LIST"

for item in $LIST; do
  mkdir ctmp
  CARGO_TARGET_DIR=ctmp cargo install "$item"
  rm -rf ctmp
done
