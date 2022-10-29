# Initial setups
print "keyboard layout: " && read kblayout
export kblayout=$kblayout
loadkeys $kblayout
dhcpcd

# Partition handling
cfdisk
print "ext4 partition path: " && read $root_part
export root_part=$root_part
print "swap partition path: " && read $swap_part

mkfs.ext4 $root_part
mkswap $swap_part

mount $root_part /mnt
swapon $swap_part

# System bloating
pacstrap /mnt base base-devel linux linux-firmware networkmanager dhcpcd neovim zsh grub doas sudo git
genfstab -U $root_part /mnt

# Chroot-ing

arch-chroot $root_part

echo "installation finished. yay!"
