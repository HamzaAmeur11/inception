FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

COPY ./script.sh .
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN chmod 777 /etc/mysql/mariadb.conf.d/50-server.cnf


RUN chmod +x script.sh
# RUN ./script.sh

EXPOSE 3306

CMD [ "./script.sh" ]
