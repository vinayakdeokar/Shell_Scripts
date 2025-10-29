#!/bin/bash

read -p "Enter directory path: " DIR
read -p "Enter text to search: " SEARCH
read -p "Enter text to replace with: " REPLACE

sed -i "s/$SEARCH/$REPLACE/g" "$DIR"/*

echo "Search and replace completed in $DIR"
