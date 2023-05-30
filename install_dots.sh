#!/bin/bash

cp home/bashrc ~/.bashrc
cp home/Xresources ~/.Xresources
cp home/xinitrc ~/.xinitrc
xrdb -merge ~/.Xresources

cp -R home/config/nvim ~/.config/nvim

cp home/config/i3/config ~/.config/i3/config
mkdir -p /home/$USER/.config/i3status
cp home/config/i3status/config ~/.config/i3status/config

cp home/gitconfig ~/.gitconfig
