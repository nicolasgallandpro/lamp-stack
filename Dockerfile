FROM php:7.4.7-apache
RUN apt update

RUN apt install git curl vim nano wget cron -y
RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update

#RUN apt install php7.4-cli php-zip unzip -y
RUN apt install unzip -y

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        graphviz 

RUN docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install fileinfo
#RUN docker-php-ext-install openssl 
RUN docker-php-ext-install tokenizer 
RUN docker-php-ext-install xml
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install json

RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#change documentRoot
ENV APACHE_DOCUMENT_ROOT /var/www/html/laravel/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

#gestion des droits et installation laravel
WORKDIR /var/www/html/
RUN chown www-data:www-data /var/www/html/
USER www-data
RUN composer create-project laravel/laravel
USER root
