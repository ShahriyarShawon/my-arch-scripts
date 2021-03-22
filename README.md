# Shays Arch installation scripts

## What the user has to do before running prechroot
- edit ssid passphrase and interface in prechroot
- partition disks

## What the user has to do after running prechroot
- arch-chroot /mnt
- set hostname
- set time zone
- edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8
- set passwd

## What prechroot does for you
- update system clock
- connect to internet
- format partitions
    - /dev/sda1 -> efi
    - /dev/sda2 -> swap
    - /dev/sda3 -> root
- mount filesystems
- pacstrap
- gen fstab


## What chroot script does
- sets hwclock
- generates locale
- installs grub
- installs microcode

