#!/bin/sh

Date() {
  date=$(date "+%a %-d %b")
  echo $date
}

Clock() {
  time=$(date "+%r")
  echo $time
}

Cpu() {
  c=$(top -bn1 | grep "Cpu(s)" |
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |
    awk '{ print "%.0f", (100 - $1) }')
  printf $c
}

Mem() {
  mem=$(free | grep Mem | awk '{ print "%.0f", ($3/$2 * 100.0) }')
  printf $mem
}
