# Paru Installer
psetup (){
	doas pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	rm -rf paru
}

# Binary Optimizer
opt(){
	strip $1
	upx $1
}

# Cargo's export and formatter
ce(){
	cargo fmt --all
	cargo build --release
	opt "target/release/${PWD##*/}"
	time "target/release/${PWD##*/}"
}

alias cr='cargo fmt --all && cargo run'
alias cb='cargo fmt --all && cargo bench'
