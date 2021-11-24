source ~/scripts/ui_tools.sh

log_proc "doas pacman -S cpio bc perl openssl make gcc binutils"

log_proc "doas make -j $(getconf _NPROCESSORS_ONLN) \
    CFLAGS='-march=native -O3 -flto -pipe' \
    CXXFLAGS='-march=native -O3 -flto -pipe'" "Generating objects"

log_proc "doas make -j $(getconf _NPROCESSORS_ONLN) \
    CFLAGS='-march=native -O3 -flto -pipe' \
    CXXFLAGS='-march=native -O3 -flto -pipe' modules" "Generating modules"

log_proc "doas make -j $(getconf _NPROCESSORS_ONLN) \
    CFLAGS='-march=native -O3 -flto -pipe' \
    CXXFLAGS='-march=native -O3 -flto -pipe' modules_install" "Installing modules"

log_proc "doas make -j $(getconf _NPROCESSORS_ONLN) \
    CFLAGS='-march=native -O3 -flto -pipe' \
    CXXFLAGS='-march=native -O3 -flto -pipe' install" "Installing kernel"

log_proc "GRUB_CMDLINE_LINUX=\"... rhgb quiet mitigations=off nowatchdog processor.ignore_ppc=1\"" "Setting boot parameters"

log_proc "doas grub-mkconfig -o /boot/grub/grub.cfg" "Updating GRUB"

log_proc "env_set" "Setting envoriment"

env_set() {
    echo 'GOVERNOR="performance"' | doas tee /etc/default/cpufrequtils
    doas systemctl disable schedutil 
}

echo "Done."
