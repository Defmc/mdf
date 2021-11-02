source ~/scripts/ui_tools.sh

le() { # Load Envoriment
    printf "Loading ~/scripts/autorun/$1...\n"
    source ~/scripts/autorun/$1
}

pfetch
for script in $(exa --all ~/scripts/autorun); do
    le $script
done
