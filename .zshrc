pfetch
for script in $(ls --all ~/scripts/autorun); do
	printf "\e[37mLoading ~/scripts/autorun/$script...\e[0m"
	source ~/scripts/autorun/$script
        if [ $? = 0 ]; then
            printf "\e[1;32m Ok!\e[0m\n"
        else
            print "\e[1;31m Error!\e[0m\n"
        fi
done
