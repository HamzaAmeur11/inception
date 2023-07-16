FROM debian:stable

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx openssl

RUN openssl req -x509 -new -newkey rsa:2048 -nodes -keyout /etc/ssl/Mykey.key -out /etc/ssl/Mycer.crt -subj "/C="MA"/ST="0"/L="0"/O="0"/OU="0"/CN="0" "

COPY nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
