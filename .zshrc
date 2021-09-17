for script in $(exa --all ~/scripts/autorun)
do
	printf "\e[1;37mLoading ~/scripts/autorun/$script...\e[0m"
	source ~/scripts/autorun/$script
	printf "\e[1;32m Ok!\e[1;37m\n"
done
