cp dotfiles/bashrc ~/.bashrc
cp dotfiles/Xresources ~/.Xresources
cp dotfiles/xinitrc ~/.xinitrc
xrdb -merge ~/.Xresources

cp dotfiles/vimrc ~/.vimrc
cp -R dotfiles/config_nvim ~/.config/nvim

cp dotfiles/i3_config ~/.config/i3/config
cp dotfiles/i3status_config ~/.config/i3status/config

cp dotfiles/gitconfig ~/.gitconfig
#sudo cp cfgs/ly_config.ini /etc/ly/config.ini
