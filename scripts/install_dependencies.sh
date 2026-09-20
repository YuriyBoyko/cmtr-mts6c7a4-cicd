#!/bin/bash

set -e

echo "Installing system dependencies..."

dnf install -y python3 python3-pip

echo "Python version:"
python3 --version

echo "Pip version:"
pip3 --version

echo "Installing Python dependencies..."

cd "$(dirname "$0")/.."

python3 -m pip install -r requirements.txt

echo "Dependencies installed successfully."