FROM nginx:1

ADD nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html
