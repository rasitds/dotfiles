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

echo '- Setup User'
read -p "Enter an login name: " login_name
echo "RUN useradd -m -G audio,video $login_name"
useradd -m -G audio,video $login_name
echo "RUN cp -R home /home/$login_name"
cp -R home /home/$login_name
echo "RUN cp install_dots.sh /home/$login_name"
cp install_dots.sh /home/$login_name
echo "RUN chmod -x /home/$login_name/install_dots.sh"
chmod +x /home/$login_name/install_dots.sh

echo 'RUN ./install_pkgs.sh'
./install_pkgs.sh

echo "RUN su - $login_name"
su - $login_name

echo 'RUN ./install_dots.sh'
./install_dots.sh
