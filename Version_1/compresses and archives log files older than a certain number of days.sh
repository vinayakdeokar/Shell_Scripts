#!/bin/bash
read -p "enter number of days: " DAYS

find /var/log -type f -mtime +$DAYS > tar.txt

tar -czvf archive.tar.gz -T tar.txt

echo "files older than $DAYS are archived into archive.tar.gz."