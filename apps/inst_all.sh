source ~/scripts/ui_tools.sh

olddir=$(pwd)

build_apps(){
    for app in $(exa -d */); do
        log_proc "cd $app && zsh ~/apps/build.sh $app" "Starting $app's build envoriment"
    done
}

build_apps

cd $olddir
