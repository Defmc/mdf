source ~/scripts/colors.sh
source ~/scripts/ui_tools.sh

up_file() {
	mkdir -p ~/dev/mdf/$1
	log_proc "cp -r ~/$1/$2 ~/dev/mdf/$1/$2" "Copying ~/$1/$2"
}

root_up_file() {
	mkdir -p ~/dev/mdf/$1
	log_proc "cp -r /$1/$2 ~/dev/mdf/$1/$2" "Copying /$1/$2"
}

up_files() {
	up_file . .Xresources
	up_file . .xinitrc
	up_file .icons .

	up_file apps .
        log_proc "rm -rf apps/**/*.o" "Removing unecessary C objects"


        up_file . .zshrc
	up_file .config picom.conf
	up_file .config gtk-3.0
	up_file . .gtkrc-2.0
	up_file .config/nvim init.lua
	up_file .config/nvim/lua .
	up_file scripts .
	up_file dev/linux-zen config
	up_file dev/linux-zen PKGBUILD

	root_up_file usr/share/themes onedark
	root_up_file etc makepkg.conf
}

up_git() {
	OLDDIR=$(pwd)
	cd ~/dev/mdf
	echo "Commit at: $(date)" >up_config.log
	git add --all >>up_config.log
	git commit -am "Update mdf" >>up_config.log
	log_proc "git push origin main -f >> up_config.log" "Pushing"
	cd $OLDDIR
}

rm_buff() {
	cp -r ~/dev/mdf/.git ~/dev/.git
	rm -rf ~/dev/mdf
	mkdir ~/dev/mdf
	mv ~/dev/.git ~/dev/mdf/.git
}

up_files
up_git
rm_buff
