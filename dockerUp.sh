#!/bin/bash

gebruikersnaam=$1
ip=$2


echo "version: '3'
services:
  webserver:
    container_name: php-apache2-mysql-main-${gebruikersnaam} 
    image: php:7.4-apache 
    volumes: 
     - ./upload:/var/www/html:z
    ports:     
     - "${ip}:80:80"" > /home/${gebruikersnaam}/ftp/docker-compose.yml


cd /home/${gebruikersnaam}/ftp
chmod 777 -R ./upload/
sudo docker run -d -p ${ip}:80:80 --volume=/home/${gebruikersnaam}/ftp/upload:/var/www/html:z --name=${gebruikersnaam} php:7.4-apache
cd /var/www/html/AccountAanmaken
