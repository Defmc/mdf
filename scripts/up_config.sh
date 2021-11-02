source ~/scripts/colors.sh
source ~/scripts/ui_tools.sh

rm_buff(){
	mv ~/dev/mdf ~/dev/mdf-old
	mkdir -p ~/dev/mdf
        cp -r ~/dev/mdf-old/.git ~/dev/mdf/.git
        log_proc "rm -rf ~/dev/mdf-old" "Clearing buffer"
}

up_file(){
	mkdir -p ~/dev/mdf/$1
        log_proc "cp -r ~/$1/$2 ~/dev/mdf/$1/$2" "Copying ~/$1/$2"
}

root_up_file(){
	mkdir -p ~/dev/mdf/$1
	log_proc "cp -r /$1/$2 ~/dev/mdf/$1/$2" "Copying /$1/$2"
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
    up_file .config/nvim/lua .
    up_file scripts .

    root_up_file usr/share/themes onedark
}

up_git(){
	OLDDIR=$(pwd)
	cd ~/dev/mdf
        echo "Commit at: $(date)" > up_config.log
	git add --all >> up_config.log
	git commit -am "Update mdf" >> up_config.log
	log_proc "git push origin main >> up_config.log" "Pushing"
	cd $OLDDIR
}

rm_buff
up_files
up_git
