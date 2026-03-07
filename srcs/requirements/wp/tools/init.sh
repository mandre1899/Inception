#!/bin/bash

#WordPress Installation
if [ ! -f /app/wordpress/wp-login.php ]; then
    tar -xzvf latest.tar.gz
fi
rm -f latest.tar.gz

#Change default address where php is listening to all interfaces
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php83/php-fpm.d/www.conf

if [ ! -f /app/wordpress/wp-config.php ]; then
    wp config create \
      --path=/app/wordpress \
      --dbname="${DB_NAME}" \
      --dbuser="${DB_USER}" \
      --dbpass="${DB_PASSWORD}" \
      --dbhost="database" \
      --allow-root
fi

if ! wp core is-installed --path=/app/wordpress --allow-root 2>/dev/null; then
    wp core install \
      --path=/app/wordpress \
      --url="https://${DOMAIN_NAME}" \
      --title="${WP_TITLE}" \
      --admin_user="${WP_ADMIN_USER}" \
      --admin_password="${WP_ADMIN_PASSWORD}" \
      --admin_email="${WP_ADMIN_EMAIL}" \
      --allow-root
fi

exec php-fpm83 -F
