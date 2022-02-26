#!/bin/sh

RED='#F7768E'
YELLOW='#9ECE6A'
GREEN='#E0AF68'
BG='#1A1B26'
NRML='#4E5173'
FG='#A9B1D6'

Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}

Cpu(){
    c=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1}')
    line="    "
    printf "${line:${#c}}""%s %s" $c%


}

Memory(){
     mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
     memp=${mem:0:-2}%
     line="       "
     printf "${line:${#memp}}""%s %s" $memp
}

Swap(){
     swp=$(free | grep Swap | awk '{print $3/$2 * 100.0}')%
     line="    "
     printf "${line:${#swp}}""%s %s" $swp
}

# Print the clock
while true; do
  echo "%{r}%{F$RED}%{B$BG}  $(Cpu) %{B$NRML} %{F$YELLOW}%{B$BG}  $(Memory) %{B$NRML} %{F$FG}%{B$BG}  $(Clock) %{B$NRML} %{F-}%{B-}"
        sleep 1
done
