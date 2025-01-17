#!/bin/bash

# Define the node you want to check
NODE="host name or ip"

# Check node health
ping -c 1 $NODE > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Node $NODE is up and running."
else
  echo "Node $NODE is down or unreachable."
fi

# Check disk space usage
DISK_USAGE=$(ssh $NODE 'df -h / | tail -1 | awk '{print $5}'')
echo "Disk space usage on $NODE: $DISK_USAGE"

# Check CPU usage
CPU_USAGE=$(ssh $NODE 'top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'')
echo "CPU usage on $NODE: $CPU_USAGE%"                                                                                             21        1,1           All
