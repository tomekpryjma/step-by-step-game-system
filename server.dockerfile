FROM php:8.1-apache

RUN a2enmod rewrite

ADD ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN mkdir -p /var/www/html

RUN addgroup --gid 1000 laravel
RUN adduser --system --shell /bin/sh --disabled-password laravel --uid 1000 --gid 1000

RUN /bin/bash -c 'chown -R laravel:laravel /var/www/html'

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql