#!/bin/bash

# Kill any previous instances of the script to prevent conflicts
pkill -f gpu_fan_control.sh

# This script adjusts the GPU fan speed based on temperature readings.
# Adjust the thresholds and speeds as needed.

# Set the minimum temperature before fans start spinning (change X as needed).
MIN_TEMP=58
MAX_TEMP=80

# Fan speed percentages based on temperature ranges.
LOW_FAN_SPEED=30
MEDIUM_FAN_SPEED=50
HIGH_FAN_SPEED=90

while true; do
    # Get the current GPU temperature.
    TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

    # Adjust fan speed based on the current temperature.
    if [ "$TEMP" -lt "$MIN_TEMP" ]; then
        # Set fan speed to 0% if below MIN_TEMP.
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=0"
    elif [ "$TEMP" -ge "$MIN_TEMP" ] && [ "$TEMP" -lt 65 ]; then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$LOW_FAN_SPEED"
    elif [ "$TEMP" -ge 65 ] && [ "$TEMP" -lt 75 ]; then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$MEDIUM_FAN_SPEED"
    elif [ "$TEMP" -ge 75 ]; then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$HIGH_FAN_SPEED"
    fi

    # Wait for 10 seconds before checking the temperature again.
    sleep 30
done
