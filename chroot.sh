#!/bin/sh

# hwclock
hwclock --systohc
echo "ran hwclock"

# generate locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo "Generated Locale"

HOSTNAME="archthinkpad"

echo "$HOSTNAME" > /etc/hostname

echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1           localhost" >> /etc/hosts
echo "127.0.0.1     $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts
echo "Did all the hostname stuff"

# set up grub

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "Installed grub"
# microcode
pacman -S intel-ucode
echo "installed intel microcode"

