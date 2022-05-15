#!/bin/sh

source ~/scripts/ui_tools.sh

rust() {
    if [[ test -f "Cargo.toml" ]]; then
      log_proc "cargo update" "updating cargo packages"
    fi
}

js() {
    if [[ test -f "package.json" ]]; then
        log_proc "npm up" "updating npm packages"
    fi
}

for folder in $(exa ~/dev/); do
  cd ~/dev/$folder
    rust
    js

  if [ $? -eq 0 ]; then
    log_proc "git commit -am \"fix: update deps\"" "Commiting" 
    log_proc "git push" "Pushing"
  fi
done
