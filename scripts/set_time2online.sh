#!/bin/sh
doas ntpdate br.pool.ntp.org
doas date -s "$date"
doas hwclock --systohc
