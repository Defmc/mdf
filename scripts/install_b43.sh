#!/bin/sh

wget https://github.com/minios-linux/b43-firmware/releases/download/b43-firmware/broadcom-wl-6.30.163.46.tar.bz2
tar xjf broadcom-wl-*.o
sudo b43-fwcutter -w /lib/firmware broadcom-wl*.o
sudo modprobe b43
