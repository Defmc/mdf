export OLDDIR=$(pwd)

cd ~/apps/st && cmp_make st
cd ~/apps/dwm && cmp_make dwm
cd ~/apps/slstts && cmp_make slstatus

cd $OLDDIR
