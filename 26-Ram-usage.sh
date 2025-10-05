#!/bin/bash

# Get total and used memory from free command
# The `free -m` command shows memory in megabytes
# The `awk` command is used to process the second line (Mem:)
# $2 is the total memory, $3 is the used memory
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
RAM_THRESHOLD=2
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS=read -r line
do
USAGE=$(echo $line | awk '{print $3}')
