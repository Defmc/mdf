source ~/scripts/colors.sh

log_proc() {
    printf "%s$FG_RESET $2..." "[..]"
    stderr=$(eval "$1")
    if [ $? -eq 0 ]; then
        printf "\r$FG_GREEN%s$RESET $2...\n" "[Ok]"
    else
        printf "\r$FG_RED%s$RESET $2: \n\t $stderr\n" "[Er]"
    fi
}
