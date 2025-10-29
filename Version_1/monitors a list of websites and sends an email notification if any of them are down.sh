#!/bin/bash
read -p "website name: " SITES
SITES=" $SITES "

EMAIL="vinayakdeokar121@gmail.com"

for SITE in $SITES; do
    ping -c 1 -W 5 $SITES > /dev/null

if [ $? -ne 0 ];

then
        echo "Website $SITES is DOWN!"
        echo "Website $SITES is DOWN!" # | mail -s "Website Down Alert" $EMAIL
else
        echo "Website $SITES is UP."
fi

done