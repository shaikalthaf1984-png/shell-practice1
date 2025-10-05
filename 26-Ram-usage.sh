#!/bin/bash

# --- Configuration ---
# Define the RAM usage threshold (e.g., 85%).
# Change this value as needed.
THRESHOLD=85

# --- Get Memory Data ---
# Extract the total and available memory in megabytes using free -m and awk.
# $2 is total RAM, $7 is available RAM.
read total_ram available_ram <<< $(free -m | awk 'NR==2{print $2,$7}')

# --- Calculate Usage Percentage ---
# The 'available' column is the most accurate for free memory.
# (Total - Available) gives the memory actually in use.
# bc is used for floating-point arithmetic.
used_percentage=$(echo "scale=2; (1 - ($available_ram / $total_ram)) * 100" | bc)

# --- Display Report ---
echo "--- RAM Usage Report ---"
echo "Total RAM: ${total_ram} MB"
echo "Available RAM: ${available_ram} MB"
echo "Used Percentage: ${used_percentage}%"

# --- Conditional Logic (Alerting) ---
# Check if the used percentage is greater than the threshold.
if (( $(echo "$used_percentage > $THRESHOLD" | bc -l) )); then
  echo "--- ALERT ---"
  echo "Warning: High memory usage detected!"
  echo "Current usage is ${used_percentage}% which exceeds the ${THRESHOLD}% threshold."
  # You can add actions here, like sending an email or logging an event.
  # For example:
  # echo "High RAM usage" | mail -s "RAM Alert on server" your_email@example.com
else
  echo "RAM usage is within acceptable limits"