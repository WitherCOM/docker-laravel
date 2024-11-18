FROM alpine:3.20

RUN apk add --no-cache \
            nginx \
            nginx-mod-http-headers-more \
            nginx-mod-http-brotli \
            php83 \
            php83-bcmath \
            php83-ctype \
            php83-curl \
            php83-dom \
            php83-fileinfo \
            php83-fpm \
            php83-gd \
            php83-iconv \
            php83-json \
            php83-ldap \
            php83-mbstring \
            php83-mysqli \
            php83-pdo \
            php83-pdo_mysql \
            php83-pdo_sqlite \
            php83-pecl-redis \
            php83-phar \
            php83-session \
            php83-sodium \
            php83-simplexml \
            php83-sqlite3 \
            php83-tokenizer \
            php83-xml \
            php83-xmlreader \
            php83-xmlwriter \
            php83-zip \
            php83-intl \
            ssmtp \ 
            wget
RUN ln -s /usr/bin/php83 /usr/bin/php
RUN mkdir /srv/http
RUN wget -O - https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin

COPY overlay /
RUN chmod +x /entrypoint.sh
WORKDIR /srv/http
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

