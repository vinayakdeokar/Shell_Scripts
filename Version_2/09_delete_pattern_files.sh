#!/bin/bash
###############################################
# Script Name   : 09_delete_pattern_files.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Delete files in a directory matching a given pattern (using arguments)
###############################################
PATTERN=$1
DIR=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <directory>"
    echo "Example: $0 '*.log' /var/log"
    exit 1
fi
if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a valid directory."
    exit 1
fi
find "$DIR" -type f -name "$PATTERN" -exec rm -f {} \;

echo "Files matching '$PATTERN' deleted from '$DIR'."

