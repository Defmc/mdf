doas ip link set wlan0 down
doas ip link set wlan0 up
doas wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf
doas dhcpcd -b
