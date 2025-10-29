#!/bin/bash
#######################################
# Script Name   : 13_setting_virtual_host_verbose.sh
# Version       : 3.0
# Date          : 28/10/2025
# Author        : Vinayak Deokar
# Purpose       : Automates the process of setting up a new virtual host with status messages
#######################################

[ "$EUID" -ne 0 ] && 
echo "Run as root" && 
exit 1
echo " Running as root"

read -p "Enter domain name: " DOMAIN
echo "Domain name entered: $DOMAIN"

DIR="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"
echo " Directory for $DOMAIN created at $DIR"
echo " Virtual host config will be: $CONF"

mkdir -p "$DIR"
echo "$DOMAIN is live!" > "$DIR/index.html"
echo "Directory created and index.html added"
sleep 3 

cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
    ErrorLog ${DIR}/error.log
    CustomLog ${DIR}/access.log combined
</VirtualHost>
EOF
echo "Virtual host configuration file created at $CONF"
sleep 3

systemctl reload httpd
echo "Apache reloaded"
sleep 3 

echo "Virtual host for $DOMAIN created successfully!"
