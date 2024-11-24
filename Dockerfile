ARG PHP_VERSION="8.3"

FROM dunglas/frankenphp:php${PHP_VERSION}-alpine

ENV SERVER_NAME=:80

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    VERSION=$(echo "$PHP_VERSION" | tr -d .) apk add --no-cache \
        php$VERSION-bcmath \
        php$VERSION-ctype \
        php$VERSION-curl \
        php$VERSION-dom \
        php$VERSION-fileinfo \
        php$VERSION-gd \
        php$VERSION-iconv \
        php$VERSION-json \
        php$VERSION-ldap \
        php$VERSION-mbstring \
        php$VERSION-mysqli \
        php$VERSION-pdo \
        php$VERSION-pdo_mysql \
        php$VERSION-pdo_sqlite \
        php$VERSION-pecl-redis \
        php$VERSION-phar \
        php$VERSION-session \
        php$VERSION-sodium \
        php$VERSION-simplexml \
        php$VERSION-sqlite3 \
        php$VERSION-tokenizer \
        php$VERSION-xml \
        php$VERSION-xmlreader \
        php$VERSION-xmlwriter \
        php$VERSION-zip \
        php$VERSION-intl \
        php$VERSION-exif \
        php$VERSION-soap \
        ssmtp
COPY overlay /
RUN chmod +x /entrypoint.sh
WORKDIR /app
EXPOSE 80
EXPOSE 80/udp

ENTRYPOINT ["/entrypoint.sh"]

