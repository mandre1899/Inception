#!/bin/bash

apk update
apk add nginx
apk add openrc

adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

mv index.html www/

rm -rf /etc/nginx/nginx.conf
mv nginx.conf /etc/nginx/

nginx -t

rc-service nginx start

