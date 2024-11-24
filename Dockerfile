ARG PHP_VERSION="8.3"

FROM dunglas/frankenphp:php${PHP_VERSION}-alpine

ENV SERVER_NAME=:80

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    PKG_VERSION=$(echo "$PHP_VERSION" | tr -d . | head -c 2) apk add --no-cache \
        php$PKG_VERSION-bcmath \
        php$PKG_VERSION-ctype \
        php$PKG_VERSION-curl \
        php$PKG_VERSION-dom \
        php$PKG_VERSION-fileinfo \
        php$PKG_VERSION-gd \
        php$PKG_VERSION-iconv \
        php$PKG_VERSION-json \
        php$PKG_VERSION-ldap \
        php$PKG_VERSION-mbstring \
        php$PKG_VERSION-mysqli \
        php$PKG_VERSION-pdo \
        php$PKG_VERSION-pdo_mysql \
        php$PKG_VERSION-pdo_sqlite \
        php$PKG_VERSION-pecl-redis \
        php$PKG_VERSION-phar \
        php$PKG_VERSION-session \
        php$PKG_VERSION-sodium \
        php$PKG_VERSION-simplexml \
        php$PKG_VERSION-sqlite3 \
        php$PKG_VERSION-tokenizer \
        php$PKG_VERSION-xml \
        php$PKG_VERSION-xmlreader \
        php$PKG_VERSION-xmlwriter \
        php$PKG_VERSION-zip \
        php$PKG_VERSION-intl \
        php$PKG_VERSION-exif \
        php$PKG_VERSION-soap \
        ssmtp
COPY overlay /
RUN chmod +x /entrypoint.sh
WORKDIR /app
EXPOSE 80
EXPOSE 80/udp

ENTRYPOINT ["/entrypoint.sh"]

