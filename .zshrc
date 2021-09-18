for script in $(exa --all ~/scripts/autorun)
do
	printf "\e[37mLoading ~/scripts/autorun/$script...\e[0m"
	source ~/scripts/autorun/$script
	printf "\e[1;32m Ok!\e[0m\n"
done
