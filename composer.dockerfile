FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    zip \
    unzip

RUN addgroup --gid 1000 laravel
RUN adduser --system --shell /bin/sh --disabled-password laravel --uid 1000 --gid 1000

RUN /bin/bash -c 'chown -R laravel:laravel /var/www/html'

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html