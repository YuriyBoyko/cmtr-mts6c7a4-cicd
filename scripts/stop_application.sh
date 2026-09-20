#!/bin/bash

echo "Stopping Flask application..."

systemctl stop mts6c7a4-app.service || true

echo "Application stopped."