source ~/scripts/ui_tools.sh

le() { # Load Envoriment
    log_proc "source ~/scripts/autorun/$1" "Loading $1"
}

pfetch
for script in $(exa --all ~/scripts/autorun); do
    le $script
done
