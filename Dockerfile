FROM php:8.0.0-apache-buster
RUN apt update

RUN apt install git curl vim nano wget -y

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
#RUN docker-php-ext-install json

