#!/bin/sh

curl "https://archlinux.org/mirrorlist/?country=BR&protocol=http&protocol=https&ip_version=4" >mirrorlist

sed -i "s/^#Server/Server/" mirrorlist

echo "mirrors:"
cat mirrorlist

rankmirrors -n 6 "mirrorlist" >"/etc/pacman.d/mirrorlist"