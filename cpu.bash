#!/bin/bash

# Threshold
THRESHOLD=80

# Email settings
EMAIL="viqaastaimoor@gmail.com"
SUBJECT="CPU Alert: High CPU Usage"
HOSTNAME=$(hostname)

# Get CPU usage (100 - idle)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_USAGE_INT=${CPU_USAGE%.*}

if [ "$CPU_USAGE_INT" -gt "$THRESHOLD" ]; then
    echo "Warning: CPU usage is at ${CPU_USAGE}% on ${HOSTNAME}" \
    | mail -s "$SUBJECT" "$EMAIL"
fi
