#!/bin/bash
#######################################
# Script Name   : compare_dirs.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Compares two directories and reports differences
#######################################

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory1> <directory2>"
    exit 1
fi

DIR1=$1
DIR2=$2

if [ ! -d "$DIR1" ]; then
    echo "Error: Directory $DIR1 does not exist."
    exit 1
fi

if [ ! -d "$DIR2" ]; then
    echo "Error: Directory $DIR2 does not exist."
    exit 1
fi

echo "Comparing $DIR1 and $DIR2 ..."
sleep 3

diff -qr "$DIR1" "$DIR2" > /tmp/dir_diff.txt

if [ -s /tmp/dir_diff.txt ]; then
    echo "Differences found:"
    cat /tmp/dir_diff.txt
else
    echo "No differences found. Both directories are identical."
fi

rm -f /tmp/dir_diff.txt
