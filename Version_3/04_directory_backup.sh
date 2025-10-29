#!/bin/bash
#######################################
# Script Name   :  04_directory_backup.sh
# Version       :  3.0 #
# Date          :  28/10/2025 #
# Credit        :  Vinayak Deokar #
# Purpose       :  Write a script that backs up a specified directory to a remote server using 'rsync' and SSH.#
#######################################

SRC_DIRECTORY=$1
DEST_USERNAME=$2
DEST_IP=$3
DEST_DIR=$4
DEST_PORT=$5
if [[ $# != "5" ]]; then
    echo "Script requires at least 5 ARGS"
    echo "Usage = $0 SRC_DIRECTORY DEST_USERNAME DEST_IP DEST_DIR DEST_PORT"
    exit 1
else
    echo "Checking remote connectivity on IP $DEST_IP on port $DEST_PORT ......"
    sleep 3
    nc -zv $DEST_IP $DEST_PORT >/dev/null 2>&1
    EXT_STA=$?
    if [[ $EXT_STA == "0" ]]; then
        echo "Remote port is open. Now copying data to Destination"
        rsync -avz $SRC_DIRECTORY $DEST_USERNAME@$DEST_IP:$DEST_DIR
        echo "Data copied successfully."
    else
        echo "Port $DEST_PORT on $DEST_IP is not reachable."
        echo "Please check the connectivity."
    fi
fi