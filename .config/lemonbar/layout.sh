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

  cpu="%{F$CPU_COLOR}  %{F$BG_ITEM}%{F-} $(Cpu)%"
  mem="%{F$MEM_COLOR}  %{F$BG_ITEM}%{F-} $(Mem)%"
  clock="%{F$WHITE}  %{F$BG_ITEM}%{F-} $(Clock)"
  echo -e -n "$cpu $mem $clock"
}
