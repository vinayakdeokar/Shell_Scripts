#!/bin/bash
#######################################
# Script Name :  listfile.sh #
# Version : 2.0 #
# Date :  15/10/2025 #
# Credit: Vinayak Deokar #
# Purpose : Write a shell script that lists all files in a specified directory and saves the output to a text file. #
#######################################

#!/bin/bash
FIND=$(cd /home/vdeokar/vinayak; echo *)
echo "the content of vinayak are: $FIND"
ls /home/vdeokar/vinayak > list_file.txt
echo "Succesfully save"