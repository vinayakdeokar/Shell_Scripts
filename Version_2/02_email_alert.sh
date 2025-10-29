#!/bin/bash

####################################### 
# Script Name 	:  02_email_alert.sh.#
# Version 	    :  2.0 #
# Date 		    :  16/10/2025 #
# Credit	    :  Vinayak Deokar #
# Purpose 	    :  Monitors disk usage and sends email alerts. #
#######################################

DISK=$1       

if [ "$#" -ne 1 ]; 
    then
    read -p "Enter the partition/disk to monitor [default: /]: " DISK
    DISK=${DISK:-/}
    
fi

echo "Monitoring partition: $DISK"

if ! df "$DISK" &>/dev/null; 
    then
    echo "Error: Partition '$DISK' does not exist or is not available."
    exit 1
fi

echo "Partition '$DISK' is available and will be monitored......"
sleep 3

THRESHOLD=${2:-80}

USAGE=$(df -P "$DISK" | awk 'NR==2 {print $5}' | tr -d '%')


if [ "$USAGE" -ge "$THRESHOLD" ]; 
    then
    echo "Warning: Disk usage of $DISK is ${USAGE}% which exceeds the threshold of ${THRESHOLD}%."

    EMAIL="your_email@example.com"   

    SUBJECT="Disk Alert: $DISK usage is ${USAGE}%"

    BODY="Warning! The disk usage of partition $DISK has reached ${USAGE}% which exceeds the threshold of ${THRESHOLD}%."

    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"

    echo "Alert email sent to $EMAIL."

    else
    echo "Disk usage of $DISK is ${USAGE}% and under the threshold ($THRESHOLD%)."
fi


