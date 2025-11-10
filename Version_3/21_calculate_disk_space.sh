#!/bin/bash
#######################################
# Script Name   : 21_calculate_disk_space.sh
# Version       : 3
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Calculate total disk space used by a specified user (single if structure)
#######################################

USER=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
elif echo "Checking if user '$USER' exists......" && sleep 2 && ! id "$USER" &>/dev/null; then
    echo "Error: User '$USER' does not exist."
    exit 1
else
    echo "User '$USER' found."
    echo "Calculating disk usage for /home/$USER ......."
    sleep 2
    USAGE=$(du -sh /home/$USER 2>/dev/null | awk '{print $1}')
    echo "Total disk space used by $USER: $USAGE"
fi
