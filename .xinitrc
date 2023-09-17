xrandr
xset r rate 200
xsetroot -cursor_name left_ptr
setxkbmap -model abnt2 -layout br -variant abnt2

picom -b --config ~/.config/picom/picom.conf
feh --bg-scale ~/img/evangelion.jpg
xrdb -merge .Xresources
exec bspwm
