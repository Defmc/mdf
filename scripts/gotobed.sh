#!/bin/sh

paru -Syyu --noconfirm
~/scripts/up_config.sh
~/scripts/clear_cache.sh
doas poweroff
