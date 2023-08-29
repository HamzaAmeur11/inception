#!/bin/sh

cp /media/sf_inception/srcs/.env ./srcs/
rm -rf /home/hameur/data/wordpress
rm -rf /home/hameur/data/mariadb

mkdir -vp /home/hameur/data/wordpress
mkdir -vp /home/hameur/data/mariadb