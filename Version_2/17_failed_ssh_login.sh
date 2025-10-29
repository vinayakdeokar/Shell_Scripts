#!/bin/bash
#######################################
# Script Name   : 17_failed_ssh_login
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Simple script to check failed SSH login attempts
#######################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi
LOG=$1
if [ ! -f "$LOG" ]; then
    echo "Error: Log file $LOG does not exist."
    exit 1
fi
FAILS=$(grep "Failed password" "$LOG")

if [ -n "$FAILS" ]; then
    echo "Failed SSH login attempts in $LOG:"
    echo "$FAILS"
else
    echo "No failed SSH login attempts found in $LOG."
fi
