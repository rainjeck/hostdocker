FROM php:8.0-fpm-alpine

RUN apk update \
  && apk add --no-cache curl-dev libzip-dev icu-dev libpng-dev libjpeg-turbo-dev freetype-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) curl mysqli pdo_mysql zip intl exif gd \
  && apk del gcc g++ && rm -rf /var/cache/apk/* && rm -rf /tmp/*