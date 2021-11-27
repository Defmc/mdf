source ~/scripts/ui_tools.sh

olddir=$(pwd)
md ~/apps
cd ~/apps

clone_apps() {
    log_proc "git clone https://git.suckless.org/dwm" "Cloning dwm"
    log_proc "git clone https://git.suckless.org/st" "Cloning st"
    log_proc "git clone https://git.suckless.org/dmenu" "Cloning dmenu"
    log_proc "git clone https://git.suckless.org/slstatus" "Cloning slstatus"
}

clone_dwm_patches(){
    md dwm/patches
    log_proc "curl https://dwm.suckless.org/patches/vanitygaps/dwm-vanitygaps-20190508-6.2.diff > dwm/patches"
}
clone_apps()
