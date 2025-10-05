#!/bin/bash

# Use free -m to get memory stats in MB and pipe the output to awk.
# The 'Mem:' line is the second line (NR==2).
# $2 is the total memory, and $3 is the used memory.
# The calculation `($3/$2)*100` computes the percentage.
# printf "%.2f%%\n" formats the output to two decimal places followed by a percentage sign.

ram_usage=$(free -m | awk 'NR==2{printf "%.2f", ($3/$2)*100}')

echo "Current RAM usage: ${ram_usage}%"

# Example of using the value in conditional logic
#if (( $(echo "$ram_usage > 80" | bc -l) )); then
 # echo "Warning: RAM usage is above 80%!"
#fi