#!/bin/bash

EMAIL="your_email@example.com"
SUBJECT="Daily System Log Summary"

{
  echo "Subject: $SUBJECT"
  echo
  echo "System log summary for $(date)"
  echo "---------------------------------"
  tail -n 50 /var/log/messages
} | sendmail "$EMAIL"

echo "Daily system log summary sent to $EMAIL"
