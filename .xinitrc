setxkbmap -model abnt2 -layout br -variant abnt2
feh --bg-scale ~/imgs/wllp.png &
xrdb -merge ~/.Xresources
picom &
slstatus &
exec dwm
