FROM php:7.2-fpm

RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev && docker-php-ext-install pdo pdo_mysql mysqli mbstring zip && docker-php-ext-enable mysqli && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd
