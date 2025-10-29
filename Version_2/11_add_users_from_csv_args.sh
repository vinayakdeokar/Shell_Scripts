#!/bin/bash
###############################################
# Script Name   : 11_add_users_from_csv_args.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Add users from CSV file (one username per line) using arguments
###############################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 <csv_file>"
    exit 1
fi
CSV_FILE=$1

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file '$CSV_FILE' not found."
    exit 1
fi
while read -r username
do
    [ -z "$username" ] && continue
    if id "$username" &>/dev/null; then
        echo "User $username already exists."
    else
        useradd -m -k /etc/skel "$username" 2>/dev/null
        echo "User $username created."
    fi
done < "$CSV_FILE"
