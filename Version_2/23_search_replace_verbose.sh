#!/bin/bash
#######################################
# Script Name   : 23_search_replace_verbose.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Performs search and replace on multiple files with status messages
#######################################

DIR=$1
SEARCH=$2
REPLACE=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <search_text> <replace_text>"
    exit 1
fi
if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

echo "Starting search and replace in directory: $DIR"
sleep 2
echo "Searching for: '$SEARCH'"
sleep 2
echo "Replacing with: '$REPLACE'"
sleep 2

sed -i "s/$SEARCH/$REPLACE/g" "$DIR"/* 2>/dev/null

echo "Search and replace completed in $DIR"