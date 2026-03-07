#!/bin/bash

#Installation of mariadb
mariadb-install-db --user=mysql --datadir=/var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
	mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking && sleep 3
fi

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mariadb -u root <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

kill $! && wait $! 2>/dev/null


#Start without deamon
mariadbd --console --user=mysql --basedir=/usr --datadir=/var/lib/mysql



