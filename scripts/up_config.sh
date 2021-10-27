load_colors(){
	source ~/scripts/colors.sh
}

rm_buff(){
	printf "$FG_RED Clearing buffer...\n"
	mv ~/dev/mdf ~/dev/mdf-old
	mkdir -p ~/dev/mdf
	cp -r ~/dev/mdf-old/.git ~/dev/mdf/.git
	rm -rf ~/dev/mdf-old
}

upF(){
	printf "$FG_WHITE Copying ~/$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r ~/$1/$2 ~/dev/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

rootUpF(){
	printf "$FG_WHITE Copying /$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r /$1/$2 ~/dev/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

up_files(){
	upF . .Xresources
	upF . .xinitrc


	upF .icons fuchsia
	rootUpF usr/share/themes onedark

	upF apps/dwm .
	upF apps/st .
	upF apps/slstatus .

	upF .config picom.conf

	upF . .zshrc
	upF .config/nvim init.lua
	upF scripts .
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/dev/mdf
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
