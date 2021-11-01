source ~/scripts/colors.sh

rm_buff(){
	printf "$FG_RED%s" "Clearing buffer..."
	mv ~/dev/mdf ~/dev/mdf-old
	mkdir -p ~/dev/mdf
	cp -r ~/dev/mdf-old/.git ~/dev/mdf/.git
	rm -rf ~/dev/mdf-old
        printf "$FG_GREEN%s$RESET\n" " Done!"
}

up_file(){
	mkdir -p ~/dev/mdf/$1
	cp -r ~/$1/$2 ~/dev/mdf/$1/$2 &>/dev/null

        if [ $? = 0 ]; then
            printf "\t$FG_GREEN[Ok]"
        else
            printf "\t$FG_RED[Err]"
        fi

        printf "\t$FG_WHITE%s\n" "~/$1/$2"
}

root_up_file(){
	mkdir -p ~/dev/mdf/$1
	cp -r /$1/$2 ~/dev/mdf/$1/$2 &>/dev/null

        if [ $? = 0 ]; then
            printf "\t$FG_GREEN[Ok]"
        else
            printf "\t$FG_RED[Err]"
        fi
	printf "\t$FG_WHITE%s\n" "/$1/$2"
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
    up_file .config/nvim/lua .
    up_file scripts .

    root_up_file usr/share/themes onedark

    printf "$FG_GREEN%s$RESET\n" "Done!"
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/dev/mdf
	printf "$FG_YELLOW%s$RESET" "Commiting..."
        echo "Commit at: $(date)" > up_config.log 2>&1
	git add --all >> up_config.log 2>&1
	git commit -am "Update mdf" >> up_config.log 2>&1
	git push origin main >> up_config.log 2>&1

        if [ $? = 0]; then
            printf "$FG_GREEN%s$RESET\n" "Done!"
        else
            printf "$FG_RED%s$RESET\n" "Error!"
        fi

	cd $OLDDIR
}

rm_buff
up_files
up_git
