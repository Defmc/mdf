rm_buff(){
	printf "$FG_RED Clearing buffer...\n"
	mv ~/dev/mdf ~/dev/mdf-old
	mkdir -p ~/dev/mdf
	cp -r ~/dev/mdf-old/.git ~/dev/mdf/.git
	rm -rf ~/dev/mdf-old
}

up_file(){
	printf "$FG_WHITE Copying ~/$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r ~/$1/$2 ~/dev/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

root_up_file(){
	printf "$FG_WHITE Copying /$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r /$1/$2 ~/dev/mdf/$1/$2
	printf "$FG_GREEN Ok!\n"
}

up_files(){
    up_file . .Xresources
    up_file . .xinitrc
    up_file .icons fuchsia
    up_file apps/dwm .
    up_file apps/st .
    up_file apps/slstatus .
    up_file .config picom.conf
    up_file . .zshrc
    up_file .config/nvim init.lua
    up_file scripts .

    root_up_file usr/share/themes onedark
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/dev/mdf
	printf "$FG_WHITE" "Commiting...$RESET"
	git add --all
	git commit -am "Update mdf"
	git push origin main
	cd $OLDDIR
	printf "$FG_GREEN" "Upload completed $RESET\n"
}

source ~/scripts/colors.sh
rm_buff
up_files
up_git
