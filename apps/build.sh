source ~/scripts/autorun/prog.sh
source ~/scripts/ui_tools.sh

log_proc "doas make clean install" "Compiling"
log_proc "opt $1" "Optimizing binary"
log_proc "rm -rf config.h" "Clearing temporaries configs"
rm -f config.h
