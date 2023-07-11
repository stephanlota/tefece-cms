#! /bin/bash

sudo yum update -y
sudo yum install -y httpd.x86_64
sudo chown -R $USER /var/www/html

wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz
sudo tar -xvf phpMyAdmin-5.2.1-all-languages.tar.gz -C /var/www/html
sudo mv /var/www/html/phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin

sudo yum install -y httpd.x86_64

sudo yum clean metadata && sudo yum install -y php-cli php-pdo php-fpm php-json php-mysqlnd

sudo systemctl enable httpd.service
sudo systemctl restart httpd.service

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install -y mysql80-community-release-el9-1.noarch.rpm
sudo dnf install -y mysql-selinux-1.0.4-2.amzn2023.0.3.noarch

sudo mv /home/ec2-user/config.inc.php /var/www/html/phpmyadmin/config.inc.php
sudo chown root:root /var/www/html/phpmyadmin/config.inc.php

sudo dnf install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo systemctl restart mysqld.service

sudo systemctl restart httpd.service
