DIR=$(pwd)
cd ~
doas paccache -r
PKGS=$(pacman -Qtdq) 
[ ! -z $PKGS ] && doas pacman -Rns --noconfirm $PKGS

doas rm -rf .cache \
	.zsh_history \
	.zshrc-back \
	.xsession-errors \
	.xsession-errors.old \
	.zshenv \
	.profile \
	.python_history \
	.mplayer \
	.gnuplot_history \
	.calc_history \
        .adobe \
        .macromedia \
        .recently-used \
        .local/share/recently-used.xbel \
        Desktop \
        .thumbnails \
        .gconfd \
        .gconf \
        .local/share/gegl-0.2 \
        .FRD/log/app.log \
        .FRD/links.txt \
        .objectdb \
        .gstreamer-0.10 \
        .pulse \
        .esd_auth \
        .config/enchant \
        .spicec \
        .dropbox-dist \
        .parallel \
        .dbus \
        ca2 \
        ca2 \
        .distlib \
        .bazaar \
        .bzr.log \
        .nv \
        .viminfo \
        .npm \
        .java \
        .oracle_jre_usage \
        .jssc \
        .tox \
        .pylint.d \
        .qute_test \
        .QtWebEngineProcess \
        .qutebrowser \
        .asy \
        .cmake \
        .gnome \
        unison.log \
        .texlive \
        .w3m \
        .subversion \
        nvvp_workspace \
        .ansible \
        .fltk \
        .vnc \

cd $DIR
