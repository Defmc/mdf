setup(){
	mkdir ~/apps
	mkdir ~/mdf
}

clone(){
	mkdir -p ~/apps
	git clone https://github.com/Defmc/mdf ~/mdf
	git clone https://git.suckless.org/dwm ~/apps/dwm
	git clone https://git.suckless.org/st ~/apps/st
	git clone https://git.suckless.org/slstatus ~/apps/slstatus
}

move(){
	echo "Moving ~/mdf/$1/$2 to ~/$1/$2..."
	mkdir -p ~/$1
	cp -r ~/mdf/$1/$2 ~/$1/$2
}

move_patched(){
	move $1 $2
	cd $1
	git apply $2
}

move_files(){
	move . .Xresources
	move . .xinitrc
	move . .zshrc

	move .config/i3 config

	move_patched apps/dwm gaps.diff

	move apps/dwm config.def.h

	move apps/st config.def.h

	#move_patched apps/st lig.diff

	move apps/slstatus config.def.h

	move .icons fuchsia

	move .config picom.conf
	move .config/nvim init.vim

	move scripts .
}

compile_proj(){
	cd ~/apps/$1
	exa
	echo "Compiling $2..."
	doas make install

	echo "Optimizing $2..."
	strip $2
	upx $2
	echo "$2 Builded!"
}

compile(){
	compile_proj st st
	compile_proj dwm dwm
	compile_proj slstatus slstatus
}

main(){
	setup
	clone
	move_files
	echo "Clone completed!"

	compile
	echo "Builds completed!"
}

main
