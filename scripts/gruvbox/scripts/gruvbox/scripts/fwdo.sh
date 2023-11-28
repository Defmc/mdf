#!/bin/sh

. "$HOME/scripts/ui_tools.sh"

log_proc "doas iptables -A INPUT -p tcp --dport $1 -j ACCEPT" "opening port $1"
log_proc "doas systemctl restart iptables" "applying new firewall rule"

log_proc "$2" "running command"
log_proc "doas iptables -A INPUT -p tcp --dport $1 -j DROP" "closing port $1"
log_proc "doas systemctl restart iptables" "recovering old firewall rule"
