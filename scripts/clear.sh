doas paccache -r
doas pacman -Rns $(pacman -Qtdq)
doas rm -rf ~/.cache
python3 'scripts/clear.py'
