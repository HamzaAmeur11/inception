FROM debian:bullseye

RUN  mkdir -vp  /var/www/
RUN mkdir /run/php/

COPY ./script.sh script.sh
RUN chmod +x script.sh

RUN apt update -y && apt upgrade -y
RUN apt install -y php php-fpm php-mysql mariadb-client curl

EXPOSE 9000

CMD [ "./script.sh" ]