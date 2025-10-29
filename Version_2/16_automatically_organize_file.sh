
#!/bin/bash
#######################################
# Script Name   : 16_automatically_organize_file.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Automatically organize files in a directory based on file types
#######################################
DIR=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 1
fi

echo "Organizing files in $DIR ..."
sleep 2

mkdir -p Images Documents Audio

mv *.jpg *.png Images/ 2>/dev/null && echo "Images moved" || echo "No images found"
mv *.pdf *.txt Documents/ 2>/dev/null && echo "Documents moved" || echo "No documents found"
mv *.mp3 *.wav Audio/ 2>/dev/null && echo "Audio files moved" || echo "No audio files found"

echo "Files organized successfully!"