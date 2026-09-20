#!/bin/bash

set -e

APP_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Starting application from: $APP_DIR"

cd "$APP_DIR"

# Stop an existing Gunicorn process if it exists
pkill -f "gunicorn.*app:app" || true

echo "Starting Gunicorn..."

nohup python3 -m gunicorn \
    --bind 0.0.0.0:8000 \
    --workers 2 \
    app:app \
    > /var/log/cmtr-mts6c7a4.log 2>&1 &

echo "Application started."