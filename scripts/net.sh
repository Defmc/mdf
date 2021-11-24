doas ip link set wlan0 up
doas wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
