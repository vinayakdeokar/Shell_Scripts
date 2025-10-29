#!/bin/bash
#######################################
# Script Name   : 19_creating_database.sh
# Version       : 2.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Automates MySQL database and user creation with privileges
#######################################
DB_NAME=$1
DB_USER=$2
DB_PASS=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <db_name> <db_user> <db_password>"
    exit 1
fi
MYSQL_ROOT_USER="root"
read -s -p "Enter MySQL root password: " MYSQL_ROOT_PASS
echo
sleep 2

SQL="CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;"

mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASS -e "$SQL"

if [ $? -eq 0 ]; then
    echo "Database '$DB_NAME' and user '$DB_USER' created successfully!"
else
    echo "Failed to create database or user."
fi
