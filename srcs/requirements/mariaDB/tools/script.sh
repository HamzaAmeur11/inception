#!/bin/sh

service mariadb start

echo "CREATE DATABASE $DB_NAME ;" > database.sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> database.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> database.sql
echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql


mysql < database.sql

kill $(cat /var/run/mysqld/mysqld.pid)

echo "MariaDB SUCCESS"
mysqld
