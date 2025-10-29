#!/bin/bash
read -p "enter number of days: " DAYS

find /var/log -type f -mtime +$DAYS > tar.txt

tar -czvf archive.tar.gz -T tar.txt

echo "files older than $DAYS are archived into archive.tar.gz."

[root@localhost vinayak]# cat system_report.sh
#!/bin/bash

echo "System Report - $(date)"
echo "------------------------"
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"
echo
echo "Memory Usage:"
free -h
echo
echo "Disk Usage:"
df -h
