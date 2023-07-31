#!/bin/sh
# chmod 777 /var/www/*
# wp core download --path=/var/www/ --allow-root
# cat /var/www/wp-config-sample.php > /var/www/wp-config.php
# chmod 0777 /var/www/*
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's|;listen.allowed_clients = 127.0.0.1|listen.allowed_clients = 0.0.0.0|g'
# chown -R www-data:www-data /var/www
# # ls -la /var/www/
# wp config set DB_NAME $DB_NAME --path=/var/www/ --allow-root
# wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
# wp config set DB_PASSWORD $USER_PASSWORD --path=/var/www/ --allow-root
# wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root

# wp core install --url=hameur.42.fr --path=/var/www/ --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PWD --admin_email=$ADMIN_MAIL --allow-root
# wp user create --allow-root  --path=/var/www/  $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS

# wp config set WP_CACHE true --path=/var/www/ --allow-root
# wp config set WP_REDIS_HOST 'redis' --path=/var/www/ --allow-root
# wp config set WP_REDIS_PORT '6379' --path=/var/www/ --allow-root
# wp plugin install redis-cache --path=/var/www --activate --allow-root
# wp redis enable --path=/var/www --allow-rootv 

if [ ! -f /var/www/html/wp-config.php ]; then
    #WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    #You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
    chmod 777 wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    #change to the working directory
    cd /var/www

    #WP-CLI includes a command to download WordPress
    wp core download --allow-root
    cp wp-config-sample.php wp-config.php

    #set permissions for the wp-config.php
    chmod 777 /var/www/wp-config.php

    #set up the database credentials for our installation
    wp config set DB_NAME $DB_NAME --allow-root
	wp config set DB_USER $DB_USER --allow-root
	wp config set DB_PASSWORD $DB_USER_PASS --allow-root
	wp config set DB_HOST $DB_HOST --allow-root


    wp config set WP_REDIS_HOST 'redis' --allow-root
	wp config set WP_REDIS_PORT '6379' --allow-root
	wp config set WP_CACHE 'true' --allow-root


    #install WordPress now, we need to run one last command, while configuring WP-CLI credentials
    wp core install --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --allow-root
    wp user create $USR $USER_EMAIL --user_pass=$USER_PASSWORD --allow-root

    #set up the redis plugin
    wp plugin install redis-cache --activate --allow-root
    wp --allow-root redis enable

    chown -R www-data:www-data /var/www/

fi

exec "$@"