#!/bin/bash
#######################################
# Script Name   : 22_search_replace_in_dir.sh
# Version       : 3.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Search and replace text in all files inside a directory
#######################################

DIR=$1
SEARCH=$2
REPLACE=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <search_text> <replace_text>"
    exit 1
elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
else
    echo "Starting search and replace in directory: $DIR"
    sleep 2
    echo "Searching for: '$SEARCH'"
    sleep 2
    echo "Replacing with: '$REPLACE'"
    sleep 2

    sed -i "s/$SEARCH/$REPLACE/g" "$DIR"/* 2>/dev/null \
    && echo "Search and replace completed successfully in $DIR." \
    || echo "Error: Failed to perform search and replace. "
fi
