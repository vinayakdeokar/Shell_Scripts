#!/bin/bash
#######################################
# Script Name   :  03_service_running.sh
# Version       :  2.0 #
# Date          :  15/10/2025 #
# Credit        :  Vinayak Deokar #
# Purpose       :  Write a shell script that checks whether a specified service is running and restarts it if it's not running.#
#######################################

#!/bin/bash
SERVICE_NAME=$1
if [ -z "$SERVICE_NAME" ]
 then
       read -p "enter service name : " SERVICE_NAME
fi

STATUS=$(systemctl is-active $SERVICE_NAME)

if [ "$STATUS" = "active" ]
then
    echo "$SERVICE_NAME is running."
else
        echo "$SERVICE_NAME is not running."
        echo "Restarting $SERVICE_NAME..."
        systemctl restart $SERVICE_NAME

NEW_STATUS=$(systemctl is-active $SERVICE_NAME)

if [ "$NEW_STATUS" = "active" ]
then
        echo "$SERVICE_NAME is restarted successfully."
else
        echo "failed to restart $SERVICE_NAME."
fi
fi