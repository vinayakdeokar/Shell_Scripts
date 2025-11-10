#!/bin/bash
#######################################
# Script Name   : 010_aws_EC2.sh
# Version       : 3.0 #
# Date          : 28/10/2025 #
# Credit        : Vinayak Deokar #
# Purpose       : Write a shell script that fetches data from an AWS EC2 API and processes the JSON response to print instance IDs and its public and private IP address. #
#######################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 <aws-region>"
    exit 1
fi
REGION=$1
if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI not installed"
    exit 1
elif ! aws ec2 describe-instances --region "$REGION" \
        --query 'Reservations[*].Instances[*].{InstanceID:InstanceId,PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress}' \
        --output json > ec2_output.json  2>/dev/null; then
    echo "Failed to fetch data from AWS EC2 API. please check your AWS CLI configuration and network connectivity."
    exit 1
elif [ ! -s ec2_output.json ]; then
    echo "No instances found or unable to fetch data."
elif command -v jq &> /dev/null; then
    echo "InstanceID           | PublicIP        | PrivateIP"
    echo "--------------------------------------------------------"
    jq -r '.[][] | "\(.InstanceID) | \(.PublicIP // "N/A") | \(.PrivateIP // "N/A")"' ec2_output.json
else
    cat ec2_output.json
fi