#!/bin/sh

# update systemclock
timedatectl set-ntp true
echo "set timedate"

# format partitions
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
echo "formatted partitions"

# mount filesystems
mount /dev/sda3 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
swapon /dev/sda2
echo "mounted filesystems"

# pacstrap
packages=( base git linux-firmware linux-lts neovim man-db man-pages
            texinfo sudo networkmanager network-manager-applet dhcp 
            xorg-server xorg-apps firefox xdg-user-dirs
            noto-fonts noto-fonts-emoji noto-fonts-extra
            xorg-xinit alacritty ttf-jetbrains-mono rofi xfce4
            xfce4-goodies pulseaudio pavucontrol
            blueberry bluez bluez-utils dunst flameshot copyq
            sxhkd peek mpv simple-scan vi
            arc-gtk-theme arc-icon-theme papirus-icon-theme
            gvfs
            )
echo "gonna install ${pages[@]}"

# pacstrap
pacstrap /mnt "${packages[@]}"

# gen fstab
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo "Generated fstab"

