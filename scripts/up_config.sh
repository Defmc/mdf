temp(){
	echo "Clearing buffer..."
	mv ~/repos/mdf ~/repos/mdf-old
	mkdir -p ~/repos/mdf
	cp -r ~/repos/mdf-old/.git ~/repos/mdf/.git
	rm -rf ~/repos/mdf-old
}

upF(){
	echo "Copying ~/$1/$2..."
	mkdir -p ~/repos/mdf/$1
	cp -r ~/$1/$2 ~/repos/mdf/$1/$2
}

rootUpF(){
	echo "Copying /$1/$2..."
	mkdir -p ~/repos/mdf/$1
	cp -r /$1/$2 ~/repos/mdf/$1/$2
}

upMDF(){
	temp
	export OLDDIR=$(pwd)

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

	cd ~/repos/mdf
	git add --all
	git commit -am "Update mdf"
	git push origin main
	cd $OLDDIR
}

upMDF
