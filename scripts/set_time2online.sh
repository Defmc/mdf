#!/bin/sh

baseurl="http://www.worldtimeapi.org/api/timezone"
area="America"
location="Sao_Paulo"
region=""

url="$baseurl/$area/$location"
if [[ -z "$region" ]]; then
    url="$url/$region"
fi
echo "$url"

date=$(curl --tlsv1.2 $url | sed -E 's/.*"datetime":"?([^,"]*)"?.*/\1/')
echo "$date"
date -s "$date"
hwclock --systohc
