FROM debian:stable

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx openssl


RUN openssl req -x509 -new -newkey rsa:2048 -nodes -keyout /etc/ssl/Mykey.key -out /etc/ssl/Mycer.crt -subj /C="MO"/ST="KH"/L="0"/O="1337"/OU="Student"/CN=hameur.1337.ma

COPY nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
