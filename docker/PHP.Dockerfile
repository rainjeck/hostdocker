FROM php:8.0-fpm-buster

RUN apt-get update \
  && apt-get install -y curl wget libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libonig-dev libzip-dev libldap2-dev libicu-dev libcurl4-openssl-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip intl curl gd \
  && apt-get autoremove && apt-get clean && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/*
