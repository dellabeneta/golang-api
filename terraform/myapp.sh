#!/bin/bash

cat << EOF | sudo tee /etc/systemd/system/myapp.service
[Unit]
Description=MyApp Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/myapp
ExecStart=/opt/myapp/myapp
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo mdir myapp

sudo systemctl daemon-reload

sudo systemctl enable myapp

sudo systemctl start myapp