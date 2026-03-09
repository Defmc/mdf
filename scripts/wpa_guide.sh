#!/bin/sh
# I always forget how to do it

sudo ip link set wlan0 up

# on wpa_cli
scan
scan_results
add_network
set_network <id> ssid "NetSSID"
set_network <id> psk "password"
enable_network <id>
select_netowrk <id>
