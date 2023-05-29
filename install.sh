#!/bin/bash

echo '- Generate locale'
echo 'RUN locale-gen'
locale-gen

echo '- Internet Connection and Network Service Setup'
echo '- Internet Connection'
ip link
read -p "Enter network interface name: " net_interface
echo "RUN ip link set $net_interface up"
ip link set $net_interface up
echo "RUN dhcpcd $net_interface"
dhcpcd $net_interface

echo '- Network Service Setup'
echo "RUN echo \"[Match]
Name=$net_interface

[Network]
DHCP=yes\" >> /etc/systemd/network/20-wired.network"
echo "[Match]
Name=$net_interface

[Network]
DHCP=yes" >> /etc/systemd/network/20-wired.network
echo 'RUN systemctl enable systemd-networkd.service'
systemctl enable systemd-networkd.service

echo '- Update packages'
echo 'RUN pacman -Syu'
pacman -Syu

echo '- Installing xorg packages'
echo 'RUN pacman -Sy xorg-server xorg-xinit'
pacman -Sy xorg-server xorg-xinit


echo "- Video Driver Installation"
echo 'RUN pacman -Ss xf86-video'
pacman -Ss xf86-video

read -p "> Enter video driver (example: amdgpu): " video_driver

echo "- Selected video driver: $video_driver"
echo "- RUN pacman -Sy xf86-video-$video_driver"
pacman -Sy xf86-video-$video_driver

echo 'Installing packages'
echo 'RUN pacman -Sy xterm i3 firefox rofi git neovim pulseaudio pavucontrol'
pacman -Sy xterm i3 firefox rofi git neovim pulseaudio pavucontrol

cp home/bashrc ~/.bashrc
cp home/Xresources ~/.Xresources
cp home/xinitrc ~/.xinitrc
xrdb -merge ~/.Xresources

cp home/vimrc ~/.vimrc
cp -R home/config/nvim ~/.config/nvim

cp home/i3/config ~/.config/i3/config
cp home/i3status_config ~/.config/i3status/config

cp home/gitconfig ~/.gitconfig