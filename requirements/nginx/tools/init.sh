!#/bin/bash

apk update

adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

mv index.html www/

rm -rf /etc/nginx/nginx.conf
mv nginx.conf /etc/nginx/
chmod 777 /etc/nginx/nginx.conf

whoami

nginx -t

nginx -gnginx -g 'daemon off;'

