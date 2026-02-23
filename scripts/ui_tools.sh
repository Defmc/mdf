#!/bin/sh

. "$HOME/scripts/colors.sh"

log_proc() {
    printf "${FG_RESET}[..] %s...\n" "$2"
    err=$(eval "$1" 2>&1)
    _rc=$?
    if [ $_rc -eq 0 ]; then
        printf "${FG_GREEN}[Ok]${RESET} %s...\n" "$2"
    else
        printf "${FG_RED}[Er]${RESET} %s:\n\t%s\n" "$2" "$err"
    fi
}
