#!/bin/sh

. ~/scripts/ui_tools.sh

rce() {
	log_proc "cross build --release --target x86_64-pc-windows-gnu" "Building for Windows (GNU)"
	log_proc "cross build --release --target x86_64-unknown-linux-gnu" "Building for Linux (GNU)"
	log_proc "cross build --release --target x86_64-unknown-linux-musl" "Building for Linux (MUSL)"
}

rusttest() {
  printf "fn main() {\n\tprintln!(\"Hello world\")\n}" >> test.rs
  "$EDITOR" test.rs || exit
  rustc test.rs
  ./test
  rm test.rs
  rm test
}

alias co="cargo"
