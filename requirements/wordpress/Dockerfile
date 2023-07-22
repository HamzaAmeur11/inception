# FROM debian:stable

# ARG MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD VERSION=7.4

# WORKDIR /var/www

# RUN apt update -y

# RUN apt upgrade -y && apt install -y wget unzip php${VERSION} php${VERSION}-fpm 
# #php${VERSION}-mysqli 
# #php${VERSION}-json php${VERSION}-curl php${VERSION}-dom php${VERSION}-exif php${VERSION}-fileinfo php${VERSION}-mbstring php${VERSION}-xml php${VERSION}-zip

# RUN sed -i "s|listen = /run/php/php${VERSION}-fpm.sock|listen = 9000|g" /etc/php/${VERSION}/fpm/pool.d/www.conf

# RUN wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip && rm -rf wp-config-sample.php && chmod -R 777 wp-content

# RUN mkdir -p /run/php/

# COPY ./script.sh .

# RUN chmod +x script.sh && ./script.sh

# CMD ["/usr/sbin/php-fpm7.4", "-F"]


FROM debian:stable

WORKDIR /var/www/html

RUN apt-get update -y && \
    apt-get install -y php-fpm php-mysqli php-curl php-gd php-xml php-imagick php-mbstring && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./script.sh .
RUN chmod +x script.sh && ./script.sh

EXPOSE 9000


CMD ["/usr/sbin/php-fpm8.2", "-F"]