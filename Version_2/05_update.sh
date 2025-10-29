#!/bin/bash
#######################################
# Script Name 	: 05_update.sh #
# Version 	    : 3.0 #
# Date 		    : 28/10/2025 #
# Credit	    : Vinayak Deokar #
# Purpose 	    : Write a shell script that checks for software updates and installs them automatically. #
#######################################

#!/bin/bash
echo "checking for updates..."
yum check-update > /dev/null 2>&1
status=$?

if [ $status -eq 100 ];
then 
	echo "updates are available."
    read -p "do you want to install updates? (y/n): " choice
	if [ "$choice" = "y" ]; then
		echo "installing updates..."
		yum update -y
		echo "all updates are installed successfully."
	elif [ "$choice" = "n" ]; then
		echo "updates not installed."
	else
		echo "Invalid choice. Exiting."
	fi

elif [ $status -eq 0 ]; then
    echo "System is up-to-date."
fi
