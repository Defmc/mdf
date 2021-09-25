#Pacman managment
alias inst='doas pacman -S --needed --noconfirm'
alias uinst='doas pacman -Syyu --needed --noconfirm'
alias uninst='doas pacman -Rns --noconfirm'
alias uuninst='doas pacman -Rnsu --noconfirm'

# Paru managment
psetup (){
	doas pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	rm -rf paru
}
alias pinst='paru -S --needed --noconfirm'
alias puinst='paru -Syyu --needed --noconfirm'
alias puninst='paru -Rns --noconfirm'
alias puuninst='paru -Rnsu --needed --noconfirm'

# System infos
alias fetch='neofetch'
alias mem='free --mega'

# User managment
alias gsd='doas cd .' # Get doas
alias keyboard='setxkbmap -model abnt2 -layout br -variant abnt2'
alias net='doas dhcpcd'

# Software Update
alias upPkg='paru -Syyu --noconfirm'
alias upX='xrdb ~/.Xresources'
alias upZSH='source ~/.zshrc'
alias upSys='upPkg; upX; upZSH'

# Programming
alias cr='cargo fmt --all && cargo run'
alias cb='cargo fmt --all && cargo bench'

opt(){
	strip $1
	upx $1
}

ce(){
	cargo --all
	cargo build --release
	opt "target/release/${PWD##*/}"
	time "target/release/${PWD##*/}"
}

# Scripts Shortcuts
alias clear_cache='sh ~/scripts/clear.sh'
alias setup='sh ~/scripts/setup.sh'
alias up_config='sh ~/scripts/up_config.sh'
alias ghdown='sh ~/scripts/ghdown.sh'
alias gittree="git log --graph --all --format='%C(cyan dim) %p %Cred %h %C(white dim) %s %Cgreen(%cr)%C(cyan dim) <%an>%C(bold yellow)%d%Creset"
