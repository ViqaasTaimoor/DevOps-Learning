#!/bin/bash

THRESHOLD=10
EMAIL="viqaastaimoor@gmail.com"

TOTAL=$(free -m | awk '/Mem:/ {print $2}')
AVAILABLE=$(free -m | awk '/Mem:/ {print $7}')

USED_PERCENT=$(( (TOTAL - AVAILABLE) * 100 / TOTAL ))

if [ "$USED_PERCENT" -gt "$THRESHOLD" ]; then
    echo "Warning: Memory usage is at ${USED_PERCENT}% on $(hostname)" | \
    mail -s "Memory Usage Alert" "$EMAIL"
fi
