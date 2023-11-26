~/scripts/min_rxfetch.sh

source "$HOME/scripts/autorun/env.sh"
source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"

for file in $(ls ~/scripts/autorun); do
    source ~/scripts/autorun/$file
done
