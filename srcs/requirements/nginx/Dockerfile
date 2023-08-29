FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade && apt-get install -y nginx
RUN mkdir /etc/nginx/ssl

COPY /tools/hameur.42.fr.crt /etc/nginx/ssl
COPY /tools/hameur.42.fr.key /etc/nginx/ssl
COPY conf/nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
