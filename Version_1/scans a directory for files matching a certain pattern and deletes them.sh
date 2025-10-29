#!/bin/bash
read -p " give pattern: " PATTERN
read -p "give the path of directory: " DIR
DIR="$DIR"
PATTERN="$PATTERN"

find "$DIR" -type f -name "$PATTERN" -exec rm -f {} \;

echo "Files matching $PATTERN deleted from $DIR."