FROM debian:stable

ARG WP_USER \
    WP_PASS \
    WP_EMAIL \
    WP_TITLE \
    DB_HOST \
    DB_NAME \
    DB_USER \
    DB_USER_PASS \
    USR \
    USER_EMAIL \
    USER_PASSWORD 

RUN mkdir /run/php/

COPY script.sh .

RUN apt-get update 
RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql php-redis curl php-tokenizer php-phar

# RUN curl -o wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     mv wp /usr/local/bin/ && chmod +x /usr/local/bin/wp && wp cli update --nightly --yes

RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

CMD [ "/usr/sbin/php-fpm8.2" , "-F"]