#!/bin/sh -e

## Add settings here
### Cache laravel config here
php artisan config:cache
### Run migration
php artisan migrate


exec "$@"
