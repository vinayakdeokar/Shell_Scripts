#!/bin/bash
#######################################
# Script Name   : 22_system_log_email.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Send daily system log summary via sendmail using $1 as recipient
#######################################

EMAIL=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <recipient_email>"
    exit 1
fi


SUBJECT="Daily System Log Summary"
  echo "Checking recipient email: $EMAIL"
  sleep 2
  echo "Generating system log summary for $EMAIL..."
  sleep 2

{
  echo "Subject: $SUBJECT"
  echo
  echo "System log summary for $(date)"
  echo "---------------------------------"
  echo "Checking system logs..."
  sleep 2

  tail -n 50 /var/log/messages 2>/dev/null || echo "No /var/log/messages found!"
} | sendmail "$EMAIL"

echo "Daily system log summary sent to $EMAIL"
