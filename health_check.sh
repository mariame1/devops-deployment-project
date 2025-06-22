#!/bin/bash

echo "script is running"


LOG_FILE="$HOME/system_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Health Check" >> $LOG_FILE
echo "CPU Load: $(uptime)" >> $LOG_FILE
echo "Memory:" >> $LOG_FILE
free -h >> $LOG_FILE
echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE
echo "------------------------------------" >> $LOG_FILE
