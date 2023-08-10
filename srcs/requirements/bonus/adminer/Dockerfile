FROM debian:stable

RUN apt update -y && apt upgrade -y
RUN apt install -y wget php8.2 php8.2-mysql

COPY ./tools/script.sh .
RUN chmod +x script.sh

CMD [ "./script.sh" ]