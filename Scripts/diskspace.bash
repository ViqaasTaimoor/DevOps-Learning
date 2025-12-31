#!/bin/bash

THRESHOLD=10
EMAIL="viqaastaimoor@gmail.com"

# Get disk usage of root partition
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Space Alert" "$EMAIL"
fi
