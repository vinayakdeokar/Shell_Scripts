#!/bin/bash
#######################################
# Script Name   : 011_create_users_from_csv.sh
# Version       : 3.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Create users from a CSV file (each line = username)
#######################################
CSV_FILE=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <csv_file>"
elif [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file '$CSV_FILE' not found."
else
    while read -r username; do
        [ -z "$username" ] && continue
        id "$username" &>/dev/null && echo "User $username already exists." ||
        ( useradd -m "$username" &>/dev/null && echo "User $username created successfully." || echo "Failed to create user $username." )
    done < "$CSV_FILE"
fi
