#!/bin/sh

baseurl="https://www.timeapi.io/api/time/current/zone?timeZone="
area="America"
location="Sao_Paulo"
region=""
url="$baseurl$area%2F$location"

echo "$url"
date=$(curl -X 'GET' $url -H 'accept: application/json' | sed -E 's/.*"dateTime":"?([^,"]*)"?.*/\1/')
echo "$date"
doas date -s "$date"
doas hwclock --systohc
