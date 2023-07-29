FROM debian:stable

# ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /run/php/; mkdir -p /var/www/; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils


COPY script.sh .
COPY entrypoint.sh /entrypoint.sh

RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql php-redis curl php-tokenizer php-phar

RUN curl -o wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv wp /usr/local/bin/ && chmod +x /usr/local/bin/wp && wp cli update --nightly --yes

RUN chmod +x script.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000

CMD ["bash", "./script.sh"]