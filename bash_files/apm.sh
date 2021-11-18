sudo systemctl start httpd
Set Apache to start at boot: sudo systemctl enable httpd.service
sudo pacman -Fy php
sudo pacman -S php-apache
sudo pacman -Rns apache
pacman -S mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl status mysql
sudo mysql_secure_installation
sudo chown -R ift:ift http
sudo vim /etc/php/php.ini
edit upload_max_filesize and post_max_size to 32MB
sudo systemctl restart httpd
enable bcmath in php.ini for laravel
