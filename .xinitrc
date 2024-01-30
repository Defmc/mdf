xrandr
xset r rate 200
unclutter --timeout 5 &
doas ~/scripts/set_time2online.sh
xsetroot -cursor_name left_ptr
setxkbmap -model abnt2 -layout br -variant abnt2
picom -b --config ~/.config/picom/picom.conf
feh --bg-scale ~/img/road.png
xrdb -merge .Xresources
exec bspwm
