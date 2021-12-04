source ~/scripts/colors.sh
source ~/scripts/ui_tools.sh

pfetch
log_proc "eval $(cat ~/scripts/net.sh)" "Initializing network driver"
log_proc "startx" "Starting I3"
