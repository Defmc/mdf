#!/bin/sh

. "$LEMONBAR_CONFIG_PATH/wm.sh"
. "$LEMONBAR_CONFIG_PATH/sys.sh"
. "$LEMONBAR_CONFIG_PATH/style.sh"

Left() {
  ws=$(Workspace "%{B$BACKGROUND}" " %{B-}" "%{B$GREEN} " " %{B-}")
  echo "$ws"
}

Center() {
  echo "$(Title)"
}

Right() {
  cpu=$(Cpu)
  perc=$(printf "%.0f" "$cpu")

  if [ $perc -gt 90 ]; then
    CPU_COLOR="$RED"
  elif [ $perc -gt 70 ]; then
    CPU_COLOR="$YELLOW"
  else
    CPU_COLOR="$GREEN"
  fi

  mem=$(Mem)
  perc=$(printf "%.0f" "$mem")

  if [ $perc -gt 90 ]; then
    MEM_COLOR="$RED"
  elif [ $perc -gt 70 ]; then
    MEM_COLOR="$YELLOW"
  else
    MEM_COLOR="$GREEN"
  fi

  cpu="%{B$GREEN}  %{B$WHITE}%{F$BACKGROUND} $(Cpu)%"
  mem="%{F$GREEN}  %{F$BACKGROUND} $(Mem)% %{F- B- T-}"
  clock="%{F$WGREEN}  %{F$BACKGROUND}%{F-} $(Clock)"
  echo "$cpu $mem $clock"
}
