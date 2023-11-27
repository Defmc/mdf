#!/bin/sh

source $LEMONBAR_CONFIG_PATH/layout.sh

while true; do
  echo -e -n "%{l}$(Left)%{c}$(Center)%{r}$(Right)"
  sleep 1
done
