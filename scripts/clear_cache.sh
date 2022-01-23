source ~/scripts/ui_tools.sh

DIR=$(pwd)
cd ~

log_proc "doas paccache -r" "Clearing pacman cache"
log_proc "paru --clean --noconfirm" "Clearing aur cache"

PKGS=$(pacman -Qtdq)
log_proc "[ ! -z $PKGS ] && doas pacman -Rns --noconfirm $PKGS" "Removing breaked dependences"

log_proc "rm -rf $(xargs -a ~/scripts/clear_cache_targets.txt)" "Removing cache folders"

cd $DIR
