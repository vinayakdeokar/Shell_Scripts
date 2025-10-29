#!/bin/bash
#######################################
# Script Name   : 20_retrieves_current_wheather.sh
# Version       : 1.0
# Date          : 22/10/2025
# Author        : Vinayak Deokar
# Purpose       : Fetch current weather for a specified location using OpenWeatherMap API
#######################################
#!/bin/bash
LOCATION=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <location>"
    exit 1
fi

echo "Fetching weather for $LOCATION..."
curl -s "https://wttr.in/$LOCATION?format=3"
