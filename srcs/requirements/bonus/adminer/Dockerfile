FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y wget php php-mysql

COPY ./tools/script.sh .
RUN chmod +x script.sh

CMD [ "./script.sh" ]