#!bin/bash

if [ ! -f /var/www/adminer.php ]; then
    mkdir -vp /var/www
    cd /var/www
    wget "http://www.adminer.org/latest.php" -O adminer.php
    mv latest.php adminer.php
    chown -R www-data:www-data /var/www/adminer.php
    chmod 755 adminer.php
fi
php -S 0.0.0.0:7070