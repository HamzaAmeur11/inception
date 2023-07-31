FROM debian:stable

ARG DB_NAME
ARG DB_USER
ARG DB_ROOT_PASSWORD
ARG USER_PASSWORD
ARG DB_HOST

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client

# RUN mkdir -vp /var/run/mysqld
# RUN chown -R mysql /var/run/mysqld
# RUN chmod -R 777 /var/run/mysqld

# RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./script.sh .
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x script.sh
RUN ./script.sh

EXPOSE 3306

CMD ["mysqld"]
