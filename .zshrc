afetch

source "$HOME/scripts/autorun/env.sh"
source "$HOME/.cargo/env"
source "$ZSH/oh-my-zsh.sh"

for file in $(ls ~/scripts/autorun); do
    source ~/scripts/autorun/$file
done

[ -f "/home/me/.ghcup/env" ] && source "/home/me/.ghcup/env" # ghcup-env