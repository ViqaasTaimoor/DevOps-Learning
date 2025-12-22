#!/bin/bash

# Install Nginx
dnf install -y nginx
# Start Nginx
systemctl start nginx
# Check status of Nginx
if systemctl is-active --quiet nginx; then
    echo "Nginx installed and running. Happy Hosting!"
else
    echo "Nginx installation failed."
fi
