DIR=$(pwd)
cd ~
doas paccache -r
doas pacman -Rns $(pacman -Qtdq)
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
	.calc_history

python3 'scripts/clear.py'
cd $DIR
