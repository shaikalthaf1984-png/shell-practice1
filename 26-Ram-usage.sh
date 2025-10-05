#!/bin/bash

MEM_INFO=$(free -m | awk 'NR==2')
TOTAL_MEM=$(echo "$MEM_INFO" | awk '{print $2}')
USED_MEM=$(echo "$MEM_INFO" | awk '{print $3}')

if [ "$TOTAL_MEM" -gt 0 ]; then
  MEM_PERCENTAGE=$(awk "BEGIN {printf \"%.2f\", ($USED_MEM / $TOTAL_MEM) * 100}")
  echo "Memory Usage: $USED_MEM MB / $TOTAL_MEM MB ($MEM_PERCENTAGE%)"
else
  echo "Error: Total memory is zero."
fi