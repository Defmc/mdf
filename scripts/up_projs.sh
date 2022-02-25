source ~/scripts/ui_tools.sh

for folder in $(exa ~/dev/); do
  cd ~/dev/$folder
  log_proc "cargo update" "Updating $folder"
  log_proc "cargo build && cargo test" "\tTesting"
  if [ $? -eq 0 ]; then
    log_proc "git commit -am \"fix: update crates\"" "\tCommiting" 
    log_proc "git push" "\tPushing"
  fi
done
