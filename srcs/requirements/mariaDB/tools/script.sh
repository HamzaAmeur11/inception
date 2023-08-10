#!/bin/sh
# sed -i "s/bind-address            = 127.0.0.1/bind-address           = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

echo "CREATE DATABASE $DB_NAME ;" > database.sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> database.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> database.sql
echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> database.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

echo "HELLO"

# sleep 10

mysql < database.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# service mysql start

# mysql -u root -p $DB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# mysql -u root -p $DB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"

# mysql -u root -p $DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# mysql -u root -p $DB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"

# mysql -u root -p $DB_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

# mysql -u root -p $DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# kill `cat /var/run/mysqld/mysqld.pid`
