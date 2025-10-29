#!/bin/bash
#######################################
# Script Name   : 07_system_report.sh
# Version       : 2.0 #
# Date          : 15/10/2025 #
# Credit        : Vinayak Deokar #
# Purpose       : displays system resource usage (CPU, Memory, Disk) #
#######################################

echo "Checking system resources..."
sleep 3 

echo "System Report - $(date)"
echo "------------------------"


echo -e "\nCPU Usage:"
top -bn1 | grep "Cpu(s)"


echo -e "\nMemory Usage:"
free -h


echo -e "\nDisk Usage:"
df -h

read -p $'\nDo you want to save this report? (y/n): ' choice

if [ "$choice" = "y" ]; then
    REPORT_FILE="Resource_Usage_Report.txt" 
    {
        echo "System Report - $(date)"
        echo "------------------------"
        echo -e "\nCPU Usage:"
        top -bn1 | grep "Cpu(s)"
        echo -e "\nMemory Usage:"
        free -h
        echo -e "\nDisk Usage:"
        df -h
    } > "$REPORT_FILE"
    
    echo "Report saved to $REPORT_FILE"
elif [ "$choice" = "n" ]; then
    echo "Report generation skipped. No file saved."
else
    echo "Invalid input. Report not saved."
fi