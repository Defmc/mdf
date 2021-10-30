# Pacman managment
alias inst='doas pacman -S --needed --noconfirm'
alias uinst='doas pacman -Syyu --needed --noconfirm'
alias uninst='doas pacman -Rns --noconfirm'
alias uuninst='doas pacman -Rnsu --noconfirm'

# Paru managment
alias pinst='paru -S --needed --noconfirm'
alias puinst='paru -Syyu --needed --noconfirm'
alias puninst='paru -Rns --noconfirm'
alias puuninst='paru -Rnsu --needed --noconfirm'

# System infos
alias fetch='pfetch'
alias mem='free --mega'
alias dir='exa --icons'

# User managment
alias keyboard='setxkbmap -model abnt2 -layout br -variant abnt2'
alias getout='upSys && clear_cache && doas poweroff'

# Software Update
alias upPkg='paru -Syyu --noconfirm'
alias upX='xrdb ~/.Xresources'
alias upSH='source ~/.zshrc'
alias upSys='upPkg ; upX; upSH'

# Scripts Shortcuts
alias clear_cache='sh ~/scripts/clear.sh'
alias setup='sh ~/scripts/setup.sh'
alias up_config='sh ~/scripts/up_config.sh'

# Google Translate
alias pt2en='trans -t english -brief'
alias en2pt='trans -t portuguese -brief'
