FROM debian:stable

ARG DB_NAME
ARG DB_USER
ARG DB_ROOT_PASSWORD
ARG USER_PASSWORD
ARG DB_HOST

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client

COPY ./script.sh .
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

RUN ls -la /var/lib/mysql/

RUN chmod +x script.sh
RUN ./script.sh

EXPOSE 3306

CMD ["mysqld"]
