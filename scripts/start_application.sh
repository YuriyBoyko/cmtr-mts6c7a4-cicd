#!/bin/bash
set -e

APP_DIR="/opt/mts6c7a4-app"

echo "Creating systemd service..."

cat > /etc/systemd/system/mts6c7a4-app.service <<EOF
[Unit]
Description=MTS6C7A4 Flask Application
After=network.target

[Service]
User=root
WorkingDirectory=$APP_DIR
ExecStart=$APP_DIR/venv/bin/gunicorn --bind 0.0.0.0:5000 --workers 2 app:app
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable mts6c7a4-app.service
systemctl restart mts6c7a4-app.service

echo "Application started successfully."