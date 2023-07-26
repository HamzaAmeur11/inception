FROM debian:stable

# RUN apt update -y && apt upgrade -y

# RUN apt install -y nginx openssl

# RUN mkdir /etc/nginx/ssl ; chmod 777 /etc/nginx/ssl

# RUN openssl req -x509 -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/Hameur.42.key -out /etc/nginx/ssl/Hameur.42.crt -subj /C="MO"/ST="KH"/L="0"/O="1337"/OU="Student"/CN=hameur.1337.ma


ENV DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get clean && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils &&\
    apt-get update && apt-get -y upgrade && apt-get install -y nginx curl ca-certificates
RUN cp /var/www/html/index.nginx-debian.html /var/www/index.html; mkdir /etc/nginx/ssl

RUN curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 \
    && chmod +x mkcert-v1.4.4-linux-amd64 && mv mkcert-v1.4.4-linux-amd64 mkcert \
    && mv mkcert /usr/local/bin/ && mkcert -key-file /etc/nginx/ssl/Hameur.42.fr.key -cert-file /etc/nginx/ssl/Hameur.42.fr.crt Hameur.42.fr;



COPY nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
