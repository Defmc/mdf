source ~/scripts/ui_tools.sh

olddir=$(pwd)
md ~/apps
cd ~/apps

clone_apps() {
    log_proc "git clone https://github.com/siduck/st st" "Cloning st (siduck's fork)"
    log_proc "git clone https://git.suckless.org/dmenu" "Cloning dmenu"
    log_proc "git clone https://git.suckless.org/slstatus" "Cloning slstatus"
}

apply_slstatus_config_patch() {
    cd slstatus
    patch ../slstatus.diff
    cd ~/apps
}

clone_dmenu_xrdb_patch(){
    log_proc "curl https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff > dmenu/xrdb.diff" "Getting dmenu's xrdb data loader patch"
    cd dmenu
    log_proc "git apply xrdb.diff" "Applying patch"
    cd ~/apps
}

build_apps(){
    for app in $(exa -d */); do
        log_proc "cd $app && zsh ~/apps/build.sh $app" "Starting $app's build envoriment"
    done
}

clone_apps
clone_dmenu_xrdb_patch
apply_slstatus_config_patch
build_apps

cd $olddir
