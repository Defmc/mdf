#!/bin/sh

. "$HOME/scripts/colors.sh"

log_proc() {
  printf "%s$FG_RESET $2..." "[..]"
  err=$(eval "$1" 2>&1)
  if [ $? -eq 0 ]; then
    printf "\r$FG_GREEN%s$RESET $2...\n" "[Ok]"
  else
    printf "\r$FG_RED%s$RESET $2: \n\t $err\n" "[Er]"
  fi
}
