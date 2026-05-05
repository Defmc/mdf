#!/bin/sh

target="$1"
touch "$target"
shift 2
for d in "$@"; do
    echo "$d" >> "$target"
    cat "$d" >> "$target"
done
echo "saved into $target"
