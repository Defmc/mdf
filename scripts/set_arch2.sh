# Timezone

ls /usr/share/zoneinfo/
printf "region: " && read region

ls /usr/share/zoneinfo/$region
printf "city: " && read city

ln -sf /usr/share/zoneinfo/$region/$city
hwclock --systohc

# Locale

nvim /etc/locale.gen
grep "^[^#]" /etc/locale.gen
printf "system language: " && read lang
echo "LANG=$lang" >/etc/locale.conf

# Vconsole keymap

echo "KEYMAP=$kblayout" >/etc/vconsole.conf

# Admin

printf "hostname: " && read hostname
echo $hostname >/etc/hostname

passwd

# Admin user

printf "username: " && read username
useradd -m -G wheel -s /bin/zsh $username
EDITOR=nvim visudo
echo "permit :wheel\npermit nopass $username" >/etc/doas.conf
nvim /etc/doas.conf

# Bootloader

printf "bootloader disk: " && read boot_disk
grub-install --target=i386-pc $boot_disk
grub-mkconfig -o /boot/grub/grub.cfg

# Paru installation

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Dotfiles

git clone https://github.com/Defmc/mdf
for f in $(ls -a mdf); do
  [ f != "."] && [ f != ".." ] && mv $f ~/$f
done
