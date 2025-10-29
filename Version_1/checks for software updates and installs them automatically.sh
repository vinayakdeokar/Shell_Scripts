#!/bin/bash
#######################################
# Script Name :  update.sh #
# Version : 2.0 #
# Date :  15/10/2025 #
# Credit: Vinayak Deokar #
# Purpose : Write a shell script that checks for software updates and installs them automatically. #
#######################################

#!/bin/bash
echo "checking for updates..."
sudo yum check-update > /dev/null
status=$?

if [ $status -eq 100 ];
then
        echo "updates are available."
elif
        [ $status -eq 0 ];
then
        echo "system is update."
fi

if [ $status -eq 100 ];
then
        echo "installing updates."
        sudo yum update -y
        echo "all update installed successfully."
else
        echo "no updates to install."
fi