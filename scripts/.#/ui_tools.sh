source ~/scripts/colors.sh

# Show execution state of a command
# Args:
#       Command
#       Message to be printed
log_proc() {
    eval "$1"# 1>/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "\t$FG_GREEN[Ok]$RESET $1...\n"
    else
        echo "\t$FG_RED[Er]$RESET $1...\n"
    fi
}
