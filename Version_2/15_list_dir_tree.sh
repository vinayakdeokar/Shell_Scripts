#!/bin/bash
#######################################
# Script Name   : find_old_files.sh
# Version       : 1.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Finds files not accessed in specified number of days
#######################################

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    echo "Example: $0 /home/user 30"
    exit 1
fi

DIR=$1
DAYS=$2

if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

echo "Searching for files in $DIR not accessed in the last $DAYS days..."
sleep 2

find "$DIR" -type f -atime +$DAYS
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