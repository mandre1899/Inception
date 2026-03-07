#!/bin/bash


#WordPress Insallation
mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz

chown -R lighttpd /usr/share/webapps/

ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

wp config create \
  --dbname="${DB_NAME}" \
  --dbuser="${DB_USER}" \
  --dbpass="${DB_PASSWORD}" \
  --dbhost="database"  

exec php-fpm83 -F
