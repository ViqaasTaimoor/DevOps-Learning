#!/bin/bash

#Ask user for the directory

read -p "Enter directory to backup: " SRC_DIR

# Define backup directory
BACKUP_DIR="${SRC_DIR}_backup"

# Check if directory exists
if [ -d "$SRC_DIR" ]; then

    # Check if backup directory already exists
    if [ -d "$BACKUP_DIR" ]; then
        echo "Backup directory already exists!"
        exit 1
    fi

    cp -r "$SRC_DIR" "$BACKUP_DIR"
    echo "Backup created: $BACKUP_DIR"

else
    echo "Directory does not exist!"
    exit 1
fi
