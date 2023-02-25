#!/bin/sh
# Apply xrandr commands to all monitors

# Configs:
# Blue light filter: --gamma 1:0.88:0.76 --brightness 90

for disp in $(xrandr | sed -n 's/^\([^ ]*\).*[^dis]connected.*/\1/p'); do
  echo "xrandr --output $disp $@"
  xrandr --output $disp $@
done
