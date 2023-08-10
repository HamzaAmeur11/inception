FROM debian:stable

RUN apt update -y && apt upgrade -y

RUN apt install redis-server -y

RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

CMD ["redis-server",  "--protected-mode", "no"]