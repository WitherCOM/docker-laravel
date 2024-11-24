ARG PHP_VERSION="8.3"

FROM dunglas/frankenphp:php${PHP_VERSION}-alpine

ENV SERVER_NAME=:80

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    PGK_VERSION=${(echo "$PHP_VERSION" | tr -d .):0:2} apk add --no-cache \
        php$PGK_VERSION-bcmath \
        php$PGK_VERSION-ctype \
        php$PGK_VERSION-curl \
        php$PGK_VERSION-dom \
        php$PGK_VERSION-fileinfo \
        php$PGK_VERSION-gd \
        php$PGK_VERSION-iconv \
        php$PGK_VERSION-json \
        php$PGK_VERSION-ldap \
        php$PGK_VERSION-mbstring \
        php$PGK_VERSION-mysqli \
        php$PGK_VERSION-pdo \
        php$PGK_VERSION-pdo_mysql \
        php$PGK_VERSION-pdo_sqlite \
        php$PGK_VERSION-pecl-redis \
        php$PGK_VERSION-phar \
        php$PGK_VERSION-session \
        php$PGK_VERSION-sodium \
        php$PGK_VERSION-simplexml \
        php$PGK_VERSION-sqlite3 \
        php$PGK_VERSION-tokenizer \
        php$PGK_VERSION-xml \
        php$PGK_VERSION-xmlreader \
        php$PGK_VERSION-xmlwriter \
        php$PGK_VERSION-zip \
        php$PGK_VERSION-intl \
        php$PGK_VERSION-exif \
        php$PGK_VERSION-soap \
        ssmtp
COPY overlay /
RUN chmod +x /entrypoint.sh
WORKDIR /app
EXPOSE 80
EXPOSE 80/udp

ENTRYPOINT ["/entrypoint.sh"]

