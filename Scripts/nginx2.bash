#!/bin/bash

# Check if Nginx is running and start the service if not.

if systemctl is-active --quiet nginx; then
    echo "Nginx is already running."
else
    echo "Nginx is not running."

    read -p "Do you want to start nginx? (yes/no): " answer

    if [ "$answer" = "yes" ]; then
        sudo systemctl start nginx

        if systemctl is-active --quiet nginx; then
            echo "Nginx started successfully."
        else
            echo "Failed to start nginx."
        fi
    else
        echo "Nginx was not started."
    fi
fi

# Show final status
systemctl status nginx --no-pager
