# #!/bin/bash
WORDPRESS_DB_HOST=wordpress-mysql-server.mysql.database.azure.com
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD=w0rdpr3ss@p4ss
WORDPRESS_DB_NAME=wordpress


sudo yum install httpd wget unzip epel-release mysql -y
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php56   [Install PHP 5.6]
sudo yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz -C /var/www/html/
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i
sudo setenforce 0
sudo chown -R apache:apache /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd

# Wordpress Password Hash Generator
# https://www.useotools.com/wordpress-password-hash-generator/output
