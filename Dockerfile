FROM alpine:3.20

RUN apk add --no-cache \
            nginx \
            nginx-mod-http-headers-more \
            nginx-mod-http-brotli \
            php82 \
            php82-bcmath \
            php82-ctype \
            php82-curl \
            php82-dom \
            php82-fileinfo \
            php82-fpm \
            php82-gd \
            php82-iconv \
            php82-json \
            php82-ldap \
            php82-mbstring \
            php82-mysqli \
            php82-pdo \
            php82-pdo_mysql \
            php82-pdo_sqlite \
            php82-pecl-redis \
            php82-phar \
            php82-session \
            php82-sodium \
            php82-simplexml \
            php82-sqlite3 \
            php82-tokenizer \
            php82-xml \
            php82-xmlreader \
            php82-xmlwriter \
            ssmtp
RUN mkdir /srv/http
RUN wget -O - https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin
COPY overlay /
WORKDIR /srv/http
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

