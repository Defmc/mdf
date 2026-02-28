#!/bin/sh
# Orphan Files Finder


scan_files() {
    echo "scanning all files outside \`/home\`..." >&2
    $all_files="$(sudo find / -path /home -prune -o -not -type d -print | sort)"
    echo "[ok] all files scanned" >&2
    echo "comparing files lists..." >&2
    echo "$(comm -23 <$(echo $all_files) <$(echo $sorted_files))"
}

get_files() {
    current=0
    for pkg in $pkgs; do
        current=$((current + 1))
        percentage=$((current * 100 / total))
        printf "\033[2K\r($current/$total)[$percentage%%] xbps-query -f $pkg..." >&2
        xbps-query -f $pkg
    done
    echo -e "\033[2K\r[ok] got all the packages' files" >&2
}

echo "getting all system packages..." >&2

curr_hash="$(xbps-query -l | md5sum)"
saved_hash="$(cat ~/.cache/xbps-forphan.sh/hash 2>/dev/null)"

if [ "$curr_hash" = "$saved_hash" ]; then
    sorted_files="$(cat ~/.cache/xbps-forphan.sh/pkg_list)"
    scan_files
    exit
fi

pkgs="$(xbps-query -l | awk '{print $2}' | cut -d- -f1)"
total="$(echo "$pkgs" | wc -l)"

printf "sorting files list..." >&2
sorted_files=$(get_files | sort)
echo -e "\033[2K\r[ok] files sorted" >&2

printf "saving pkg_list cache..." >&2
mkdir -p ~/.cache/xbps-forphan.sh/
echo "$sorted_files" > ~/.cache/xbps-forphan.sh/pkg_list
echo "$curr_hash" > ~/.cache/xbps-forphan.sh/hash
echo -e "\033[2K\r[ok] cache saved" >&2


scan_files
