#!/bin/bash

DATA=$(aws ec2 describe-instances --output json)

echo "Instance ID               | Public IP         | Private IP"
echo "--------------------------------------------------------------"
echo "$DATA" | jq -r '.Reservations[].Instances[] | "\(.InstanceId)\t|\t\(.PublicIpAddress // "N/A")\t|\t\(.PrivateIpAddress)"'