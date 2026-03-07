#!/bin/bash

apk update

adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

mv index.html www/

#Set coustom server config
rm -rf /etc/nginx/nginx.conf
mv nginx.conf /etc/nginx/
chmod 777 /etc/nginx/nginx.conf

#Create SSL-certificate
mkdir -p /etc/nginx/ssl
openssl req -x509 -noenc -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/my.key -out /etc/nginx/ssl/my.crt \
    -subj "/C=DE/ST=Baden-Württem-Berg/L=Heilbronn/O=42/CN=mandre.fr"

nginx -t

nginx -g 'daemon off;'

