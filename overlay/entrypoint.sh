#!/bin/sh -e

## Add settings here

### Setup php socket folder
mkdir -p /run/php

### Cache laravel config here
php artisan config:cache
### Run migration
php artisan migrate


exec "$@"
