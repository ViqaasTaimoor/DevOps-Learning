#!/bin/bash

# Check if directory exists, create if it doesn't.

read -p "Enter directory to search: " SRC_DIR
if [ -d "$SRC_DIR" ]; then
	echo " $SRC_DIR exists!"
else
	read -p "Want to create (yes/no): " reply
	if [ "$reply" = "yes" ]; then
        mkdir "$SRC_DIR"
        echo " $SRC_DIR is created!"
else
	echo "Aborted!"
	fi
fi
