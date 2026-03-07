#!/bin/bash

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

#Start without deamon
mariadbd --console --user=mysql --basedir=/usr --datadir=/var/lib/mysql

