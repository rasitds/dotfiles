#!/bin/bash
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
