FROM php:7.4-apache
RUN apt-get update && apt-get install -y
RUN apt-get install zlib1g-dev libpng-dev -y
RUN docker-php-ext-install pdo_mysql exif pcntl bcmath gd

RUN mkdir -p /var/www/app/public
RUN chown -R www-data:www-data /var/www/app/public
RUN chmod -R 755 /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y mariadb-client

RUN apt-get install -y git
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip

RUN echo "<?php phpinfo(); ?>" >> /var/www/app/public/index.php

COPY ./app.conf /etc/apache2/sites-available/app.conf

RUN a2dissite 000-default.conf
RUN a2ensite app.conf

RUN a2enmod expires
RUN a2enmod headers
RUN a2enmod rewrite

RUN service apache2 start