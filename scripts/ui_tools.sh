source ~/scripts/colors.sh

# Show execution state of a command
# Args:
#       Command
#       Message to be printed
log_proc() {
    eval "$1" # 1>/dev/null 2>&1
    if [ $? -eq 0 ]; then
        printf "\t$FG_GREEN%s$RESET $2...\n" "[Ok]"
    else
        printf "\t$FG_RED%s$RESET $2...\n" "[Er]"
    fi
}
