doas wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
doas dhclient wlan0 &
