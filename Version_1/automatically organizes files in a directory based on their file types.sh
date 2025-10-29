#!/bin/bash
read -p "Enter directory path: " DIR
cd "$DIR"

mkdir -p Images Documents Audio

mv *.jpg *.png Images/ 2>/dev/null
mv *.pdf *.txt Documents/ 2>/dev/null
mv *.mp3 *.wav Audio/ 2>/dev/null

echo "Files organized successfully!"