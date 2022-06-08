FROM php:7.4-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN apt-get update \
    && apt-get install -y git zip unzip zlib1g-dev libzip-dev \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install zip \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install bcmath