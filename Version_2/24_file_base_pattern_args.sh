#!/bin/bash
#######################################
# Script Name   : 24_file_base_pattern_args.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Rename multiple files in a directory using prefix and starting number via arguments
#######################################

DIR=$1
PREFIX=$2
START=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <prefix> <starting_number>"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

cd "$DIR" || exit

COUNT=$START
for FILE in *; do
    [ -f "$FILE" ] || continue
    EXT="${FILE##*.}"
    mv "$FILE" "${PREFIX}${COUNT}.${EXT}"
    echo "Renamed $FILE → ${PREFIX}${COUNT}.${EXT}"
    ((COUNT++))
done

echo "All files renamed successfully!"
