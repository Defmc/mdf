#!/bin/sh

. "$HOME/scripts/colors.sh"

log_proc() {
    printf "\033[s$FG_RESET[..]$2...\n"
    err=$(eval "$1" 2>&1)
    if [ $? -eq 0 ]; then
        printf "\033[u$FG_GREEN[Ok]$RESET $2...\n"
    else
        printf "\033[u$FG_RED[Er]$RESET $2: \n\t $err\n"
    fi
}
