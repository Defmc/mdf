~/scripts/min_rxfetch.sh

source "$ZSH/oh-my-zsh.sh"

for file in $(ls ~/scripts/autorun); do
    source ~/scripts/autorun/$file
done
