#!/bin/sh

if [ ! -f /var/www/wp-config.php ]; then
    #WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
   cd /var/www
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    #You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
    chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
    ls /etc/php/7.4/fpm/pool.d/
    #WP-CLI includes a command to download WordPress
    wp --allow-root core download
    mv wp-config-sample.php wp-config.php

    #set permissions for the wp-config.php
    chmod 777 /var/www/wp-config.php

    #set up the database credentials for our installation
    wp config set DB_NAME $DB_NAME --allow-root
	wp config set DB_USER $DB_USER --allow-root
	wp config set DB_PASSWORD $DB_PASSWORD --allow-root
	wp config set DB_HOST $DB_HOST --allow-root

    wp config set WP_REDIS_HOST 'redis' --allow-root
	wp config set WP_REDIS_PORT '6379' --allow-root
	wp config set WP_CACHE 'true' --allow-root

    #install WordPress now, we need to run one last command, while configuring WP-CLI credentials
    wp  --allow-root core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$WP_MAIL --skip-email
    wp  --allow-root user create $WP_USER $USER_EMAIL --role=author  --user_pass=$WP_PASS

    set up the redis plugin
    wp plugin install redis-cache --activate --allow-root
    wp --allow-root redis enable

    chown -R www-data:www-data /var/www/

fi
echo "WORDPRESS SUCCESS"
exec /usr/sbin/php-fpm7.4 -F