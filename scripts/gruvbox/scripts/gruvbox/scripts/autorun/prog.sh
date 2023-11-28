#!/bin/sh

. "$HOME/scripts/ui_tools.sh"

rusttest() {
  printf "fn main() {\n\tprintln!(\"Hello world\")\n}" >>test.rs
  "$EDITOR" test.rs || exit
  rustc test.rs
  ./test
  rm test.rs
  rm test
}

loop() {
    command="$@"
    while 1=1; do
        sh -c $command
    done
}
