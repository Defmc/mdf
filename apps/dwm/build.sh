source ~/scripts/colors.sh
source  ~/scripts/autorun/aliases.sh

printf "$FG_RED Compiling...\n$RESET"
doas make clean install
printf "$FG_RED Optimizing binary...\n$RESET"
opt dwm
printf "$FG_RED Clearing temporaries configs...\n$RESET"
rm -f config.h
