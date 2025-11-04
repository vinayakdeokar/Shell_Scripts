#!/bin/bash
#######################################
# Script Name   : 06_archive.sh #
# Version       : 3.0 #
# Date          : 28/10/2025 #
# Credit        : Vinayak Deokar #
# Purpose       : Write a script that compresses and archives log files older than a certain number of days. #
#######################################

#!/bin/bash
    echo "Step 1: Checking if there are any log files to process in /var/log..."
    sleep 1 

    read -p "enter number of days: " DAYS 

if [ -z "$DAYS" ] || [ "$DAYS" -lt 1 ] 2>/dev/null; then
    echo "Error: Please enter a valid positive number."
    exit 1
fi

    echo "You entered $DAYS days."

    echo "Searching for log files older than $DAYS days..."

    find /var/log -type f -mtime +$DAYS 2>/dev/null > tar.txt

    tar -czvf archive.tar.gz -T tar.txt

    echo "files older than $DAYS are archived into archive.tar.gz."
