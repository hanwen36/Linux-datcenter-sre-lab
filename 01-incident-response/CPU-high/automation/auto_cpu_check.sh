#!/bin/bash

echo "==============================="
echo "      CPU Monitoring Tool      "
echo "==============================="
date

echo ""
echo "[INFO] Checking CPU usage..."

top_process=$(ps -eo pid,comm,%cpu --sort=-%cpu | sed -n '2p')

echo ""
echo "[ANALYSIS] Top CPU process:"
echo "$top_process"

cpu_raw=$(echo "$top_process" | awk '{print $3}')
cpu=${cpu_raw%.*}

echo ""
echo "[INFO] CPU Usage: $cpu%"

if [ -z "$cpu" ]; then
    echo "[ERROR] Failed to parse CPU usage"
    exit 1
fi

if [ "$cpu" -gt 80 ]; then
    echo ""
    echo "[WARNING] High CPU usage detected"
    echo "[ACTION] Killing all yes processes"
    pkill yes 2>/dev/null
    echo "[DONE] yes processes terminated"

    echo ""
    echo "[VALIDATION] Checking CPU again..."
    ps -eo pid,comm,%cpu --sort=-%cpu | head -5
else
    echo "[OK] CPU usage is normal"
fi

echo ""
echo "=============================="
echo "       CHECK COMPLETED        "
echo "=============================="