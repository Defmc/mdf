#!/bin/sh

doas iwctl device wlan0 set-property Powered on
doas iwctl --passphrase "$(cat ~/toks/wifi_pass)" station wlan0 connect "$(cat ~/toks/wifi_ssid)"
doas dhcpcd
