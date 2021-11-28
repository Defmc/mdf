source ~/scripts/ui_tools.sh

olddir=$(pwd)
md ~/apps
cd ~/apps

clone_apps() {
    log_proc "git clone https://github.com/siduck/chadwm dwm" "Cloning dwm"
    log_proc "git clone https://github.com/siduck/st st" "Cloning st (siduck's fork)"
    log_proc "git clone https://git.suckless.org/dmenu" "Cloning dmenu"
    log_proc "git clone https://git.suckless.org/slstatus" "Cloning slstatus"
}

gen_build_script(){
    for app in .; do
        log_proc "cat \"zsh ~/apps/build.sh $app\" > $app/build.sh" "Generating build script for $app"
    done
}

clone_dmenu_xrdb_patch(){
    log_proc "curl https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff > dmenu/xrdb.diff" "Getting dmenu's xrdb data loader patch"
    cd dmenu
    log_proc "git apply xrdb.diff" "Applying patch"
}

build_apps(){
    for app in .; do
        cd $app
        zsh build.sh
    done
}

clone_apps
clone_dmenu_xrdb_patch
gen_build_script
build_apps

cd $olddir
