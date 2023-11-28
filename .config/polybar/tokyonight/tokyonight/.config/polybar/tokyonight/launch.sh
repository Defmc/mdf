#!/bin/sh
#
export POLYBAR_RUNNING_THEME_DIRECTORY="$(dirname $0)"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c "$POLYBAR_RUNNING_THEME_DIRECTORY/config.ini" &
