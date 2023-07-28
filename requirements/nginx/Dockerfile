FROM debian:stable

# RUN apt update -y && apt upgrade -y

# RUN apt install -y nginx openssl

# RUN mkdir /etc/nginx/ssl ; chmod 777 /etc/nginx/ssl

# RUN openssl req -x509 -new -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/hameur.42.fr.key -out /etc/nginx/ssl/hameur.42.fr.crt -subj /C="MO"/ST="KH"/L="0"/O="1337"/OU="Student"/CN=hameur.1337.ma

# RUN chmod 777 /etc/nginx/ssl/Hameur.42.fr.crt

#/etc/nginx/ssl/Hameur.42.fr.crt

ENV DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get clean && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils &&\
    apt-get update && apt-get -y upgrade && apt-get install -y nginx curl ca-certificates
RUN cp /var/www/html/index.nginx-debian.html /var/www/index.html; mkdir /etc/nginx/ssl

RUN curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 \
    && chmod +x mkcert-v1.4.4-linux-amd64 && mv mkcert-v1.4.4-linux-amd64 mkcert \
    && mv mkcert /usr/local/bin/ && mkcert -key-file /etc/nginx/ssl/hameur.42.fr.key -cert-file /etc/nginx/ssl/hameur.42.fr.crt hameur.42.fr


COPY nginx.conf /etc/nginx/
# COPY index.html /var/www/
# RUN chmod 0777 /var/www/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
