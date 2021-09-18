load_colors(){
	source ~/scripts/colors.sh
}

rm_buff(){
	echo "$FG_RED Clearing buffer..."
	mv ~/repos/mdf ~/repos/mdf-old
	mkdir -p ~/repos/mdf
	cp -r ~/repos/mdf-old/.git ~/repos/mdf/.git
	rm -rf ~/repos/mdf-old
}

upF(){
	printf "$FG_WHITE Copying ~/$1/$2..."
	mkdir -p ~/repos/mdf/$1
	cp -r ~/$1/$2 ~/repos/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

rootUpF(){
	printf "$FG_WHITE Copying /$1/$2..."
	mkdir -p ~/repos/mdf/$1
	cp -r /$1/$2 ~/repos/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

up_files(){
	temp
	load_colors

	upF . .Xresources
	upF . .xinitrc


	upF .icons fuchsia
	rootUpF usr/share/themes onedark

	upF apps/dwm config.h
	upF apps/dwm gaps.diff
	upF apps/st config.h

	upF apps/slstatus config.h

	upF .config picom.conf

	upF . .zshrc
	upF .config/nvim init.vim
	upF scripts .
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/repos/mdf
	echo "$FG_WHITE Commiting... $RESET"
	git add --all
	git commit -am "Update mdf"
	git push origin main
	cd $OLDDIR
	echo "$FG_GREEN Upload completed $RESET"
}

rm_buff
up_files
up_git
