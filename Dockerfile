FROM ubuntu:18.04

LABEL maintainer="José González"

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get install -y --no-install-recommends \
    libapache2-mod-php7.2 \
    php7.2 \
    php7.2-bcmath \
    php7.2-cli \
    php7.2-curl \
    php7.2-dev \
    php7.2-gd \
    php7.2-json \
    php7.2-imap \
    php7.2-intl \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-odbc \
    php7.2-pgsql \
    php7.2-readline \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-zip \
    php-memcache \
    php-odbc \
    php-pear \
    php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite \
    && a2enmod curl \
    && a2enmod gd \
    && a2enmod mysql

EXPOSE 80
EXPOSE 443

CMD ["/run.sh"]
