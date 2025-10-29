#!/bin/bash
function DISK_MAIL () {
echo -e "Hello All This is system generated email, do not reply to this email.
partitions on host `/bin/hostname` is reached to threshold. Kindly take necessary action ASAP to avoid future inconvenience.
Server Name : - `hostname`
Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'`
Thank & Regards
Team CloudEthix"
}

WARN=4
df -h / | egrep -v "Filesystem|tmpfs" > /tmp/df.txt
while read C1 C2 C3 C4 C5 C6
do
CHK=`echo $C5 | cut -d'%' -f1`
 if [[ $CHK -gt $WARN ]]
then
echo -e "\n********************WARNING**********************"
echo -e "\nYour Disk Utilization of $C6 is Reached To Threshold $C5"
DISK_MAIL
else echo -e "\nYour Disk Utilization is under Threshold $C5"
fi
done < /tmp/df.txt