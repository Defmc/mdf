load_colors(){
	source ~/scripts/colors.sh
}

rm_buff(){
	printf "$FG_RED Clearing buffer...\n"
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
	upF . .Xresources
	upF . .xinitrc


	upF .icons fuchsia
	rootUpF usr/share/themes onedark

	upF apps/dwm config.def.h
	upF apps/dwm gaps.diff
	upF apps/dwm moveresize.diff
	upF apps/dwm build.sh

	upF apps/st config.def.h

	upF apps/slstatus config.def.h

	upF .config picom.conf

	upF . .zshrc
	upF .config/nvim init.vim
	upF scripts .
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/repos/mdf
	printf "$FG_WHITE Commiting... $RESET"
	git add --all
	git commit -am "Update mdf"
	git push origin main
	cd $OLDDIR
	printf "$FG_GREEN Upload completed $RESET"
}

load_colors
rm_buff
up_files
up_git
