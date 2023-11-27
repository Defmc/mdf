#!/bin/sh

Date() {
  date=$(date "+%a %-d %b")
  echo -e -n $date
}

Clock() {
  time=$(date "+%r")
  echo -e -n $time
}

Cpu() {
  c=$(top -bn1 | grep "Cpu(s)" |
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |
    awk '{ print "%.2f", (100 - $1) }')
  printf $c
}

Mem() {
  mem=$(free | grep Mem | awk '{ print "%.2f", ($3/$2 * 100.0) }')
  printf $mem
}
