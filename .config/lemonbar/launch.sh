#!/bin/sh

FONT_0="JetBrainsMono NF:style=Bold:size=10"
FONT_1="FontAwesome 7 Free:style=Solid:size=12"
FONT_2="JetBrainsMono NF:style=Bold:size=14"

SCREEN_W=$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -dx -f1)
BAR_W=$((SCREEN_W - 20))
BAR_H=40

"$HOME/dev/lemonade/target/release/lemonade" | lemonbar -p \
  -g "${BAR_W}x${BAR_H}+10+10" \
  -f "$FONT_0" -f "$FONT_1" -f "$FONT_2" \
  -o -3
