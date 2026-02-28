#!/bin/sh
# Valid just to bspc compatibles wms

# icon-0 = 1;%{T3}󰔶%{T-}
# icon-1 = 2;%{T3}󰝤%{T-}
# icon-2 = 3;%{T3}󰜁%{T-}
# icon-3 = 4;%{T3}󰋘%{T-}
# icon-4 = 5;%{T3}󰏃%{T-}

WorkspaceName() {
    case "$1" in 
        "1") echo "󰔶" ;;
        "2") echo "󰝤" ;;
        "3") echo "󰜁" ;;
        "4") echo "󰋘" ;;
        "5") echo "󰏃" ;;
    esac
}

Workspace() {
  q=$(bspc query -D --names)
  focus=$(bspc query -D -d focused --names)
  output=""
  for ws in $q; do
    if [ $focus != $ws ]; then
        output="$output$(WorkspaceName "$ws")$2 "
    else
        output="$output$3$(WorkspaceName "$ws")$4 "
    fi
  done
  echo "$output"
}

Title() {
  q=$(bspc query -T -n)
  title=$(echo $q | jq -r ".client.instanceName")
  echo $title
}
