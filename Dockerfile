ARG PHP_VERSION="8.3"

FROM dunglas/frankenphp:php${PHP_VERSION}-alpine

ENV SERVER_NAME=:80

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    install-php-extensions \
        bcmath \
        ctype \
        curl \
        dom \
        fileinfo \
        gd \
        iconv \
        json \
        ldap \
        mbstring \
        mysqli \
        pdo \
        pdo_mysql \
        pdo_sqlite \
        redis \
        phar \
        session \
        sodium \
        simplexml \
        sqlite3 \
        tokenizer \
        xml \
        xmlreader \
        xmlwriter \
        zip \
        intl \
        exif \
        soap &&\
    apk add --no-cache ssmtp
COPY overlay /
RUN chmod +x /entrypoint.sh
WORKDIR /app
EXPOSE 80
EXPOSE 80/udp

ENTRYPOINT ["/entrypoint.sh"]

