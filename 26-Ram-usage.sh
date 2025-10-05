#!/bin/bash

# Get total and used memory from free command
# The `free -m` command shows memory in megabytes
# The `awk` command is used to process the second line (Mem:)
# $2 is the total memory, $3 is the used memory
MEM_INFO=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
RAM_THRESHOLD=2
TOTAL_MEM=$(free -m | grep  Mem | awk '{print $2}')
USED_MEM=$(free -m | grep Mem | awk '{print $3}' )
AVAILABLE_MEM=$(free -m | grep Mem | awk '{print $7}')
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS=read line
do
USAGE=$( $USED_MEM % $TOTAL_MEM * 100 )
CURRE_AVAILABLE=$(echo $USAGE -ge 2 | awk '{print $7}')
if [ $USAGE -ge $RAM_THRESHOLD ]; then
MESSAGE+="High RAM Usage on $CURRE_AVAILABLE: $USAGE % <br>"
 fi
done <<< $MEM_INFO

echo -e "Message Body: $MESSAGE"

sh mail.sh "shaikalthaf1984@gmail.com" "High RAM Usage Alert" "High RAM Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5

