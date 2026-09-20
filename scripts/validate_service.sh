#!/bin/bash

set -e

echo "Checking application health..."

for i in {1..12}; do
    if curl -fs http://127.0.0.1:8000/ > /dev/null; then
        echo "Application is healthy."
        exit 0
    fi

    echo "Application is not ready yet. Attempt $i/12..."
    sleep 5
done

echo "Application failed health check."
exit 1