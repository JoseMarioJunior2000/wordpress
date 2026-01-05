FROM wordpress:php8.1-fpm-alpine

COPY ./nginx-conf/default.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS
