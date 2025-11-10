#!/bin/bash
#######################################
# Script Name   :  03_service_running.sh
# Version       :  3
# Date          :  28/10/2025
# Credit        :  Vinayak Deokar
# Purpose       :  Checks whether a specified service is running and restarts it if not.
#######################################

check_service() {
    SERVICE_NAME=$1

    if [ -z "$SERVICE_NAME" ]; then
        read -p "Enter service name: " SERVICE_NAME 
        sleep 3
    fi
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "$SERVICE_NAME is already running."
    elif systemctl restart "$SERVICE_NAME" &>/dev/null && systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "$SERVICE_NAME was not running but has been restarted successfully."
    else
        echo "Failed to restart $SERVICE_NAME. Please check the service name or logs."
    fi
}
check_service "$1"
