#!/bin/bash
set -e

APP_DIR="/opt/mts6c7a4-app"

echo "Installing system dependencies..."

apt-get update
apt-get install -y python3 python3-venv python3-pip

echo "Creating application directory..."
mkdir -p "$APP_DIR"

echo "Creating virtual environment..."
python3 -m venv "$APP_DIR/venv"

echo "Installing Python dependencies..."
"$APP_DIR/venv/bin/pip" install --upgrade pip
"$APP_DIR/venv/bin/pip" install -r "$APP_DIR/requirements.txt"

echo "Dependencies installed successfully."