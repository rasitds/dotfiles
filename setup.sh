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
read -p "Enter a login name: " login_name
echo "RUN useradd -m -G audio,video $login_name"
useradd -m -G audio,video $login_name
echo "- SET PASSWORD FOR \"$login_name\""
passwd $login_name

echo '- COPYING CONFIG FILES'

echo "RUN cp -R home /home/$login_name"
cp -R home /home/$login_name
echo "RUN chown -R $login_name /home/$login_name/home"
chown -R $login_name /home/$login_name/home
echo "RUN cp install_dots.sh /home/$login_name"
cp install_dots.sh /home/$login_name
echo "RUN chown $login_name /home/$login_name/install_dots.sh"
chown $login_name /home/$login_name/install_dots.sh
echo "RUN chmod -x /home/$login_name/install_dots.sh"
chmod +x /home/$login_name/install_dots.sh

sleep 4

echo 'RUN sh install_pkgs.sh'
sh install_pkgs.sh

echo "- SWITCHING USER. PLEASE RUN the \"sh install_dots.sh\" command when you log in $login_name"

echo "RUN su - $login_name"
su - $login_name