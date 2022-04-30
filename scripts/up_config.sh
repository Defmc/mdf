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
        up_file . .zshrc
	up_file .config gtk-3.0
	up_file . .gtkrc-2.0
        up_file .config/polybar/my .
        up_file .config/picom picom.conf
	up_file .config/nvim/lua .
        up_file .cargo config.toml
        up_file .cargo env
	up_file scripts .
        up_file .config/bspwm .
        up_file img sky_mansion.jpg
        up_file .config/sxhkd .
	up_file .themes TokyoNight
	root_up_file etc makepkg.conf
}

up_git() {
	OLDDIR=$(pwd)
	cd ~/dev/mdf
        git add -A .
        git commit -am "update dotfiles"
	git push origin main -f
	cd $OLDDIR
}

rm_buff() {
	cp -r ~/dev/mdf/.git ~/dev/.git
	rm -rf ~/dev/mdf
	mkdir ~/dev/mdf
	mv ~/dev/.git ~/dev/mdf/.git
}

log_proc "rm_buff" "Removing old buffer"
up_files
up_git
