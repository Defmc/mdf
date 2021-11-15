setxkbmap -model abnt2 -layout br -variant abnt2
feh --bg-scale ~/imgs/wllp.png &
picom &
slstatus &
xrdb -merge ~/.Xresources
exec dwm
