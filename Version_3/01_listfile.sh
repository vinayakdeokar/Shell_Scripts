#!/bin/bash
####################################### 
# Script Name 	:  01_listfile.sh #
# Version 	    :  2.0 #
# Date 		    :  16/10/2025 #
# Credit	    :  Vinayak Deokar #
# Purpose 	    :  Lists all files in a specified directory and saves output to a text file. #
#######################################

DIRECTORY=$1
OUTPUT_FILE=$2

if [ -z "$DIRECTORY" ] || [ -z "$OUTPUT_FILE" ]; 
then
    echo "Usage: $0 <directory_path> <output_file>"
    exit 1

elif [ ! -d "$DIRECTORY" ]; 
then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
else
    ls -lh "$DIRECTORY" > "$OUTPUT_FILE"
    echo "Files from '$DIRECTORY' have been saved to '$OUTPUT_FILE'."
fi  