#!/bin/bash

# create xdg dirs
xdg-user-dirs-update

# start network manager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

# basic xinitrc
echo "copyq &" >> ~/.xinitrc
echo "sxhkd &" >> ~/.xinitrc
echo "exec xfce4-session" >> ~/.xinitrc


