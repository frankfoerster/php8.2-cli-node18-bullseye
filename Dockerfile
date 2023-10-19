FROM php:8.2.5-cli-bullseye

RUN set -x \
    && apt-get update \
    && apt-get install -y libicu-dev libzip-dev zip unzip rsync openssh-client

RUN docker-php-ext-install intl
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs
