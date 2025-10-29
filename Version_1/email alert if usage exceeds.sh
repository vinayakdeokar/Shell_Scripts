!/bin/bash
#######################################
# Script Name :  service.sh #
# Version : 2.0 #
# Date :  15/10/2025 #
# Credit: Vinayak Deokar #
# Purpose : Write a shell script that checks whether a specified service is running and restarts it if it's not running. #
#######################################

#!/bin/bash
read -p "enter serviec name : " service_name

status=$(systemctl is-active $service_name)

if [ "$status" = "active" ];
then
    echo "$service_name is running."
else
        echo "$service_name is not running."
        echo "Restarting $service_name..."
        systemctl restart $service_name

new_status=$(systemctl is-active $service_name)

if [ "$new_status" = "active" ];
then
        echo "$service_name is restarted successfully."
else
        echo "failed to restart $service_name."
fi
fi
