#!/bin/bash
# Delete the last three lines of a specified file.

read -p "Specify the file: " file

if [ -e "$file" ]; then
    echo "File exists."

    read -p "Do you want to delete the last 3 lines? (yes/no): " prompt

    if [ "$prompt" = "yes" ]; then
        sed -i '$d' "$file"
        sed -i '$d' "$file"
        sed -i '$d' "$file"
        echo "Last 3 lines deleted successfully."
    else
        echo "Aborted!"
    fi

else
    echo "File does not exist!"
fi
