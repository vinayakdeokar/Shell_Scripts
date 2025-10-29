#!/bin/bash
DIR1="${1:-/mnt/vinayak_old/home/vdeokar/test1}"
DIR2="${2:-/mnt/vinayak_old/home/vdeokar/test2}"

if [ ! -d "$DIR1" ] || [ ! -d "$DIR2" ];
then
    echo "One or both directories do not exist."
    exit 1
fi

echo "Comparing directories:"
echo "DIR1: $DIR1"
echo "DIR2: $DIR2"
echo "------------------------"

diff -qr "$DIR1" "$DIR2"

if [ $? -eq 0 ];
then
    echo " Directories are identical."
else
    echo " Directories have differences."
fi