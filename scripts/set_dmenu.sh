#!/bin/sh

localdir=$(pwd)

mkdir ~/dev
git clone https://git.suckless.org/dmenu ~/dev/dmenu
cd ~/dev/dmenu

curl "https://gist.githubusercontent.com/Defmc/1467b4679153e7daa9d9079071bc12cc/raw/xresources.diff" >x.diff

git apply x.diff

doas make clean install
