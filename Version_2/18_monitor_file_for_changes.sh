#!/bin/bash
#######################################
# Script Name   : 18_monitor_file_for_changes.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Monitors a file for changes and executes a specific action when modified
#######################################
FILE=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_to_monitor>"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist."
    exit 1
fi

    echo "Monitoring file: $FILE"
    sleep 3

    LAST_MOD=$(stat -c %Y "$FILE")
while true; do
    sleep 2
    
    NEW_MOD=$(stat -c %Y "$FILE")
    if [ "$NEW_MOD" -ne "$LAST_MOD" ]; then
        echo "File $FILE modified at $(date)"
        LAST_MOD=$NEW_MOD
    fi
done
