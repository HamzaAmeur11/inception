FROM debian:buster

RUN  mkdir -vp  /var/www/

RUN mkdir /run/php/

COPY ./script.sh script.sh

RUN chmod +x script.sh

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-fpm php-mysql mariadb-client curl
# RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql php-redis php-tokenizer php-phar curl mariadb-client

EXPOSE 9000

CMD [ "./script.sh" ]

# FROM debian:stable

# RUN mkdir /run/php/

# COPY script.sh .
# RUN chmod +x script.sh

# RUN apt-get update 

# EXPOSE 9000

# CMD [ "./script.sh" ]