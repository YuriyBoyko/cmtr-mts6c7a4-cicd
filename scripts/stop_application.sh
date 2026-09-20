#!/bin/bash

set -e

echo "Stopping application..."

pkill -f "gunicorn.*app:app" || true

echo "Application stopped."