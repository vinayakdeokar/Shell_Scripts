#!/bin/bash
#######################################
# Script Name   : 17_check_failed_ssh_logins.sh
# Version       : 2.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Checks for failed SSH login attempts from a log file
#######################################

LOG=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file>"
elif [ ! -f "$LOG" ]; then
    echo "Error: Log file '$LOG' does not exist."
else
    FAILS=$(grep "Failed password" "$LOG")

    if [ -n "$FAILS" ]; then
        echo "Failed SSH login attempts in $LOG:"
        echo "$FAILS"
    else
        echo "No failed SSH login attempts found in $LOG."
    fi
fi
