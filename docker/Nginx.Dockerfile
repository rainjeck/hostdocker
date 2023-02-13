FROM nginx

ADD docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/app
