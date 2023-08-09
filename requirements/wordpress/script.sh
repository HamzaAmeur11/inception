#!/bin/sh

# sed -i 's|;listen.allowed_clients = 127.0.0.1|listen.allowed_clients = 0.0.0.0|g'

if [ ! -f /var/www/wp-config.php ]; then
    #WP-CLI is available as a PHP Archive file (.phar). You can download it using either wget or curl commands:
   
   cd /var/www
   
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    #You need to make this .phar file executable and move it to /usr/local/bin so that it can be run directly:
    chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
    
    #WP-CLI includes a command to download WordPress
    wp --allow-root core download
    
    # wp --allow-root core config --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS
    
    mv wp-config-sample.php wp-config.php

    #set permissions for the wp-config.php
    chmod 777 /var/www/wp-config.php

    sed -i "s/database_name_here/$DB_NAME/g" /var/www/wp-config.php
    sed -i "s/username_here/$DB_USER/g" /var/www/wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/g" /var/www/wp-config.php
    sed -i "s/localhost/$DB_HOST/g" /var/www/wp-config.php

    #set up the database credentials for our installation
    # wp config set DB_NAME $DB_NAME --allow-root
	# wp config set DB_USER $DB_USER --allow-root
	# wp config set DB_PASSWORD $DB_USER_PASS --allow-root
	# wp config set DB_HOST $DB_HOST --allow-root


    # wp config set WP_REDIS_HOST 'redis' --allow-root
	# wp config set WP_REDIS_PORT '6379' --allow-root
	# wp config set WP_CACHE 'true' --allow-root


    #install WordPress now, we need to run one last command, while configuring WP-CLI credentials
    wp  --allow-root core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$WP_MAIL --skip-email
    wp  --allow-root user create $WP_USER $USER_EMAIL --role=author  --user_pass=$WP_PASS

    #set up the redis plugin
    # wp plugin install redis-cache --activate --allow-root
    # wp --allow-root redis enable

    # chown -R www-data:www-data /var/www/

fi
echo "WEEWWWEEEEWWWEEEEEEE"
exec /usr/sbin/php-fpm7.3 -F

