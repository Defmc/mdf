xrandr
xsetroot -cursor_name left_ptr
setxkbmap -model abnt2 -layout br -variant abnt2

sh ~/.config/polybar/launch.sh
feh --bg-scale ~/img/sky_mansion.jpg
xrdb -merge .Xresources
exec bspwm
