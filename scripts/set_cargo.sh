#!/bin/sh

install() {
  mkdir ctmp
  CARGO_TARGET_DIR=ctmp cargo install "$1"
  rm -rf ctmp
}

install cargo-expand
install cargo-udeps
install cargo-audit
install cargo-bloat
install cargo-watch
install cargo-nextest
install cargo-update
install loc
install stylua
install cargo-edit
install cargo-spellcheck
install exa
install ripgrep
