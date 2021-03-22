#!/bin/sh

# update systemclock
timedatectl set-ntp true
echo "set timedate"

# connect to internet
SSID=
PASSPHRASE=
INTERFACE=
iwctl --passphrase $PASSPHRASE station $INTERFACE connect $SSID
echo "connected to internet via $SSID"

# format partitions
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
echo "formatted partitions"

# mount filesystems
mount /dev/sda3 /mnt
swapon /dev/sda2
echp "mounted filesystems"

# pacstrap
packages=( base base-devel linux-firmware linux-lts neovim man-db man-pages
            tex-info sudo networkmanager network-manager-applet dhcp 
            xorg-server xorg-apps
            xorg-xinit alacritty ttf-jetbrains-mono rofi 
            )
echo "gonna install ${pages[@]}"

# pacstrap
pacstrap /mnt "${packages[@]}"

# gen fstab
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo "Generated fstab"

