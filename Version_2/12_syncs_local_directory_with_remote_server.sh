#!/bin/bash
###############################################
# Script Name   : 12_syncs_local_directory_with_remote_server.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Periodically sync a local directory with a remote server using rsync
###############################################

if [ $# -ne 4 ]; then
    echo "Usage: $0 <local_dir> <remote_user> <remote_host> <remote_dir>"
    exit 1
fi

LOCAL_DIR=$1
REMOTE_USER=$2
REMOTE_HOST=$3
REMOTE_DIR=$4

if [ ! -d "$LOCAL_DIR" ]; then
    echo "Error: Local directory '$LOCAL_DIR' not found."
    exit 1
fi
    rsync -avz --delete "$LOCAL_DIR"/ "$REMOTE_USER"@"$REMOTE_HOST":"$REMOTE_DIR"

if [ $? -eq 0 ]; then
    echo "Sync completed successfully at $(date)"
else
    echo "Sync failed at $(date)"
fi
