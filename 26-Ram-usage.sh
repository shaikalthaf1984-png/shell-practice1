#!/bin/bash

MEM_USAGE=$(free -h | grep  Mem)
RAM_THRESHOLD=2

IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $2}' | cut -d "M" -f1)
    MEMORY=$(echo $line | awk '{print $3}')
    if [ $USAGE -ge $RAM_THRESHOLD ]; then
        MESSAGE+="High Ram usage on $Memory: $USAGE % <br>" # escaping
    fi
done <<< $MEM_USAGE
