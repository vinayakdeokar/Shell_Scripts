#!/bin/bash
#######################################
# Script Name   :  new_users_mail_report.sh
# Version       :  3.0
# Date          :  28/10/2025
# Author        :  Vinayak Deokar
# Purpose       :  Find users created in last 24 hours and email report
#######################################

EMAIL=$1
REPORT="/tmp/new_users_report.txt"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <recipient_email>"
    exit 1
elif [ -z "$EMAIL" ]; then
    echo "Error: Email address is empty."
    exit 1
else
    echo "Recipient email set to: $EMAIL"
    sleep 1

    echo "Generating report file at $REPORT"
    echo "New Linux Users Report - $(date)" > "$REPORT"
    echo "---------------------------------" >> "$REPORT"

    echo "Searching for users created in last 24 hours..."
    sleep 1
    find /home -maxdepth 1 -type d -ctime -1 -exec basename {} \; >> "$REPORT"

    if [ ! -s "$REPORT" ]; then
        echo "No new users found in the last 24 hours."
        echo "No new users found in last 24 hours." >> "$REPORT"
    else
        echo "New users found and added to report."
    fi

    sleep 1
    echo "Sending report to $EMAIL..."
    cat "$REPORT" | sendmail "$EMAIL"

    if [ $? -eq 0 ]; then
        echo "Report sent successfully to $EMAIL"
    else
        echo "Failed to send report. Check sendmail configuration."
   fi
fi
