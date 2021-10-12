#Pacman managment
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

# User managment
alias gsd='doas cd .' # Get doas
alias keyboard='setxkbmap -model abnt2 -layout br -variant abnt2'

# Software Update
alias upPkg='paru -Syyu --noconfirm'
alias upX='xrdb ~/.Xresources'
alias upZSH='source ~/.zshrc'
alias upSys='upPkg; upX; upZSH'

# Scripts Shortcuts
alias clear_cache='sh ~/scripts/clear.sh'
alias blue='sh ~/scripts/blue.sh'
alias setup='sh ~/scripts/setup.sh'
alias up_config='sh ~/scripts/up_config.sh'
alias ghdown='sh ~/scripts/ghdown.sh'
alias gittree="git log --graph --all --format='%C(cyan dim) %p %Cred %h %C(white dim) %s %Cgreen(%cr)%C(cyan dim) <%an>%C(bold yellow)%d%Creset"

# Google Translate
alias pt2en='trans -t english -brief'
alias en2pt='trans -t portuguese -brief'
