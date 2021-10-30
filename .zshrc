le() { # Load Envoriment
    printf "\e[37mLoading ~/scripts/autorun/$1...\e[0m"
    source ~/scripts/autorun/$1
    if [ $? = 0 ]; then
        printf "\e[1;32m Ok!\e[0m\n"
    else
        print "\e[1;31m Error!\e[0m\n"
    fi
}

pfetch
for script in $(exa --all ~/scripts/autorun); do
    le $script
done
