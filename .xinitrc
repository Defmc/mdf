xrandr
xsetroot -cursor_name left_ptr
setxkbmap -model abnt2 -layout br -variant abnt2

./.config/lemonbar/launch.sh
feh --bg-scale ~/img/sky_mansion.jpg
xrdb -merge .Xresources
exec bspwm
