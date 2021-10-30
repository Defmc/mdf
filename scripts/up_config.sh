rm_buff(){
	printf "$FG_RED%s" "Clearing buffer..."
	mv ~/dev/mdf ~/dev/mdf-old
	mkdir -p ~/dev/mdf
	cp -r ~/dev/mdf-old/.git ~/dev/mdf/.git
	rm -rf ~/dev/mdf-old
        printf "$FG_GREEN%s$RESET\n" " Done!"
}

up_file(){
        printf "        $FG_WHITE%s" "~/$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r ~/$1/$2 ~/dev/mdf/$1/$2 &>/dev/null

        if [ $? = 0 ]; then
            printf "$FG_GREEN Ok!\n"
        else
            printf "$FG_RED Err!\n"
        fi
}

root_up_file(){
	printf "        $FG_WHITE%s" "/$1/$2..."
	mkdir -p ~/dev/mdf/$1
	cp -r /$1/$2 ~/dev/mdf/$1/$2 &>/dev/null

        if [ $? = 0 ]; then
            printf "$FG_GREEN Ok!\n"
        else
            printf "$FG_RED Err!\n"
        fi
}

up_files(){
    printf "$FG_YELLOW%s$RESET\n" "Updating files..."

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

    printf "$FG_GREEN%s$RESET\n" "Done!"
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/dev/mdf
	printf "$FG_YELLOW%s$RESET\n" "Commiting..."
	git add --all
	git commit -am "Update mdf"
	git push origin main
	cd $OLDDIR
	printf "$FG_GREEN%s$RESET\n" "Upload completed"
}

source ~/scripts/colors.sh
rm_buff
up_files
up_git
