#!/bin/sh

baseurl="http://worldtimeapi.org/api/timezone"
area="America"
location="Sao_Paulo"
region=""

url="$baseurl/$area/$location"
if [[ -z "$region" ]]; then
    url="$url/$region"
fi
echo "$url"

date=$(curl $url | sed -E 's/.*"datetime":"?([^,"]*)"?.*/\1/')
echo "$date"
hwclock --systohc
