source ~/scripts/colors.sh

# Show execution state of a command
# Args:
#       Command
#       Message to be printed
log_proc() {
    printf "$FG_YELLOW%s$RESET $2..." "[..]"
    stderr=$(eval "$1" 1>/dev/null 2>&1)
    if [ $? -eq 0 ]; then
        printf "\r$FG_GREEN%s$RESET $2...\n" "[Ok]"
    else
        printf "\r$FG_RED%s$RESET $2: \n\t $stderr\n" "[Er]"
    fi
}
