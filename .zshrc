source ~/scripts/colors.sh

le() { # Load Envoriment
    printf "Loading ~/scripts/autorun/$1..."
    source ~/scripts/autorun/$1
    if [ $? = 0 ]; then
        printf "$FG_GREEN Ok!$RESET\n"
    else
        print "$FG_RED Err!$RESET\n"
    fi
}

pfetch
for script in $(exa --all ~/scripts/autorun); do
    le $script
done
