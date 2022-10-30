#!/bin/sh
# Valid just to bspc compatibles wms

Workspace() {
  q=$(bspc query -D --names)
  focus=$(bspc query -D -d focused --names)
  for ws in $q; do
    if [ $focus != $ws ]; then
      echo -e -n "$1$ws$2 "
    else
      echo -e -n "$3$ws$4 "
    fi
  done
}

Title() {
  q=$(bspc query -T -n)
  title=$(echo $q | jq -r ".client.instanceName")
  echo -e -n $title
}
