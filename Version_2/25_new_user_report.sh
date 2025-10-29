#!/bin/bash
#######################################
# Script Name   : 25_new_user_report.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Generate and email a report of newly created Linux users in last 24 hours
#######################################

EMAIL=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <recipient_email>"
    exit 1
fi

    echo "Recipient email set to: $EMAIL"
    sleep 2

REPORT="/tmp/new_users_report.txt"
    echo "Generating report file at $REPORT"
    sleep 1

    echo "New Linux Users Report - $(date)" > "$REPORT"
    echo "---------------------------------" >> "$REPORT"

    echo "Searching for users created in last 24 hours..."
    sleep 2
    find /home -maxdepth 1 -type d -ctime -1 -exec basename {} \; >> "$REPORT"
if [ ! -s "$REPORT" ]; then
    echo "No new users found in the last 24 hours."
    echo "No new users found in last 24 hours." >> "$REPORT"
else
    echo "New users found and added to report."
fi
    sleep 2

    echo "Sending report to $EMAIL..."
    cat "$REPORT" | sendmail "$EMAIL"
    sleep 2
    echo "Report sent successfully to $EMAIL"
