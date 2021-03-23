# Shays Arch installation scripts

## What the user has to do before running prechroot
- partition disks
- connect to internet
    - I use wlan0 and I know my network SSID so I'd run:
    iwctl --passphrase PASSPHRASE station wlan0 connect SSID
    - Here's the general command
    iwctl --passphrase PASSPHRASE station DEVICE connect SSID

## What the user has to do after running prechroot
- arch-chroot /mnt
- set hostname
- set time zone
- edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8
- set passwd

## What to do after chroot
- install a desktop environment
- install base-devel if you want to use aur (you probably do)


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

