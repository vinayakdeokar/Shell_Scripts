#!/bin/bash
#######################################
# Script Name   : 15_find_old_files.sh
# Version       : 3.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Find files not accessed in specified number of days
#######################################

DIR=$1
DAYS=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    echo "Example: $0 /home/user 30"
elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
else
    echo "Searching for files in $DIR not accessed in the last $DAYS days..."
    sleep 2

    TEMP_FILE=$(mktemp)
    find "$DIR" -type f -atime +$DAYS > "$TEMP_FILE"

if [ -s "$TEMP_FILE" ]; then
    echo "Files found:"
    cat "$TEMP_FILE"
else
    echo "No files found that are older than $DAYS days."
fi

    rm -f "$TEMP_FILE"
    echo "Search completed."
fi
