#!/bin/bash
#######################################
# Script Name   : 23_rename_files_with_prefix.sh
# Version       : 3.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Rename all files in a directory with prefix and numbering
#######################################

DIR=$1
PREFIX=$2
START=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <prefix> <starting_number>"
    exit 1
elif [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
else
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
fi
