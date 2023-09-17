#!/bin/sh

date -s "$(python3 $(dirname "$0")/get_online_time.py)"
