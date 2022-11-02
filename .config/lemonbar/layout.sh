#!/bin/sh

source $LEMONBAR_CONFIG_PATH/wm.sh
source $LEMONBAR_CONFIG_PATH/sys.sh
source $LEMONBAR_CONFIG_PATH/style.sh

Left() {
  ws=$(Workspace "%{B$BG_ITEM} " " %{B-}" "%{B$GREEN} " " %{B-}")
  echo -e -n "$ws"
}

Center() {
  echo -e -n "$(Title)"
}

Right() {
  cpu=$(Cpu)
  perc=$(printf "%.0f" $cpu)

  if [ $perc -gt 90 ]; then
    CPU_COLOR="$RED"
  elif [ $perc -gt 70 ]; then
    CPU_COLOR="$YELLOW"
  else
    CPU_COLOR="$GREEN"
  fi

  mem=$(Mem)
  perc=$(printf "%.0f" $mem)

  if [ $perc -gt 90 ]; then
    MEM_COLOR="$RED"
  elif [ $perc -gt 70 ]; then
    MEM_COLOR="$YELLOW"
  else
    MEM_COLOR="$GREEN"
  fi

  cpu="%{B$CPU_COLOR}  %{B$BG_ITEM} $(Cpu)% %{B-}"
  mem="%{B$MEM_COLOR}  %{B$BG_ITEM} $(Mem)% %{B-}"
  clock="%{B$WHITE}  %{B$BG_ITEM} $(Clock) %{B-}"
  echo -e -n "$cpu $mem $clock"
}
