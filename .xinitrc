xrandr
xset r rate 200
xsetroot -cursor_name left_ptr
setxkbmap -model abnt2 -layout br -variant abnt2
picom -b --config ~/.config/picom/picom.conf
feh --bg-scale --randomize ~/img/wallpaper/gruvbox/
xrdb -merge .Xresources
doas ~/scripts/set_time2online.sh &
unclutter &
exec bspwm
