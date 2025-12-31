#!/bin/bash

# Always log cron execution (for debugging)
echo "Cron triggered at $(date)" >> /tmp/cron_debug.log

# Exit if not Thursday
if [ "$(date +%u)" -ne 4 ]; then
    exit 0
fi

# Actual task
echo "Thursday matched at $(date)" >> /tmp/cron_debug.log
