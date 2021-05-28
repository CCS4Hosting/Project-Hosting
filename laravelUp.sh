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
sudo docker run -d -p ${ip}:80:80 --volume=/home/${gebruikersnaam}/ftp/upload:/var/www/app/:z --name=${gebruikersnaam}-laravel laravel

docker exec ${gebruikersnaam}-laravel bash -c 'cd /var/www/app ; chmod -R 777 storage/'

docker exec ${gebruikersnaam}-laravel bash -c 'cd /var/www/app ; composer install'

docker exec ${gebruikersnaam}-laravel bash -c 'cd /var/www/app ; php artisan key:generate'

docker exec ${gebruikersnaam}-laravel bash -c 'cd /var/www/app ; php artisan migrate'

docker exec ${gebruikersnaam}-laravel bash -c 'cd /var/www/app ; php artisan db:seed'
