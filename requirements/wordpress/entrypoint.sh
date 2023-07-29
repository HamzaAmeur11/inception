#!/bin/bash

# Database setup
if [ -z "$(wp core is-installed --allow-root)" ]; then
    wp core download --path=/var/www/ --allow-root
    cat /var/www/wp-config-sample.php > /var/www/wp-config.php
    chmod 0777 /var/www/*
    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
    sed -i 's|;listen.allowed_clients = 127.0.0.1|listen.allowed_clients = 0.0.0.0|g'
    chown -R www-data:www-data /var/www
    wp config set DB_NAME $DB_NAME --path=/var/www/ --allow-root
    wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
    wp config set DB_PASSWORD $USER_PASSWORD --path=/var/www/ --allow-root
    wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root
    wp core install --url=hameur.42.fr --path=/var/www/ --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PWD --admin_email=$ADMIN_MAIL --allow-root
    wp user create --allow-root --path=/var/www/ $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS
fi

exec "$@"