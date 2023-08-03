#!/bin/sh

mysql_install_db

service mariadb start

mysql -u root -p $DB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mysql -u root -p $DB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$USER_PASSWORD';"

mysql -u root -p $DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysql -u root -p $DB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"

mysql -u root -p $DB_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

mysql -u root -p $DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

kill `cat /var/run/mysqld/mysqld.pid`

# ls -la /var/lib/mysql

# if [ ! -d "/var/lib/mysql/$DB_NAME" ]
# then
# 	mysql -u root -e "DROP DATABASE IF EXISTS test;"
# 	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO 	'$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# 	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
# 	mysql -u root -e "FLUSH PRIVILEGES;"
# fi

# mysqladmin shutdown -p${DB_ROOT_PASSWORD}

# exec mysqld --user=mysql