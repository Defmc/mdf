#!/bin/sh

source $LEMONBAR_CONFIG_PATH/wm.sh
source $LEMONBAR_CONFIG_PATH/sys.sh
source $LEMONBAR_CONFIG_PATH/style.sh

Left() {
  ws=$(Workspace "%{B$BG_ITEM} " " %{B$BG_BAR}" "%{B$GREEN} " " %{B$BG_BAR}")
  echo -e -n "$ws"
}

Center() {
  echo -e -n "$(Title)"
}

Right() {
  cpu="%{B$GREEN}  %{B$BG_ITEM} $(Cpu)% %{B$BG_BAR}"
  mem="%{B$GREEN}  %{B$BG_ITEM} $(Mem)% %{B$BG_BAR}"
  clock="%{B$WHITE}  %{B$BG_ITEM} $(Clock) %{B$BG_BAR}"
  echo -e -n "$cpu $mem $clock"
}
