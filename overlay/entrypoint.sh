#!/bin/sh -e

export COMMAND="$1" # web, queue, schedule

echo "Running pre config script"
if [ -f /app/preconfig.sh ]; then
    source /app/preconfig.sh
fi

if [ "${COMMAND}" = "web" ]; then
    echo "Starting web server";
    exec frankenphp run --config /etc/caddy/Caddyfile --adapter caddyfile;
fi

if [ "${COMMAND}" = "queue" ]; then
    echo "Starting queue";
    if [ ! -f /app/artisan ]; then
        echo "Failed to start artisan not found";
        exit 1;
    fi
    exec php artisan queue:work --sleep=3;
fi

if [ "${COMMAND}" = "schedule" ]; then
    echo "Starting schedule task";
    if [ ! -f /app/artisan ]; then
        echo "Failed to start artisan not found";
        exit 1;
    fi
    exec php artisan schedule:run;
fi
echo "Running custom command";
exec "$@"
