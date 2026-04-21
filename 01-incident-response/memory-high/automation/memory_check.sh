#!/bin/bash

echo "======================================"
echo "        Memory Monitoring Tool        "
echo "======================================"
date
echo ""

MEM_THRESHOLD=80
SWAP_THRESHOLD=20
AVAIL_THRESHOLD=800000   # 约 800 MB, 单位 KB

echo "[INFO] Checking memory usage..."

# Get memory stats
mem_total=$(free | awk '/Mem:/ {print $2}')
mem_used=$(free | awk '/Mem:/ {print $3}')
mem_free=$(free | awk '/Mem:/ {print $4}')
mem_available=$(free | awk '/Mem:/ {print $7}')
swap_total=$(free | awk '/Swap:/ {print $2}')
swap_used=$(free | awk '/Swap:/ {print $3}')

# Calculate percentages
mem_usage=$((mem_used * 100 / mem_total))

if [ "$swap_total" -gt 0 ]; then
    swap_usage=$((swap_used * 100 / swap_total))
else
    swap_usage=0
fi

echo ""
echo "[INFO] Memory Total     : ${mem_total} KB"
echo "[INFO] Memory Used      : ${mem_used} KB"
echo "[INFO] Memory Free      : ${mem_free} KB"
echo "[INFO] Memory Available : ${mem_available} KB"
echo "[INFO] Memory Usage     : ${mem_usage}%"
echo "[INFO] Swap Usage       : ${swap_usage}%"

memory_alert=0

# Detection logic
if [ "$mem_usage" -ge "$MEM_THRESHOLD" ]; then
    echo ""
    echo "[WARNING] High memory usage detected by percentage"
    memory_alert=1
fi

if [ "$mem_available" -le "$AVAIL_THRESHOLD" ]; then
    echo ""
    echo "[WARNING] Low available memory detected"
    memory_alert=1
fi

if [ "$swap_usage" -ge "$SWAP_THRESHOLD" ]; then
    echo ""
    echo "[WARNING] Swap usage is elevated"
    memory_alert=1
fi

# Analysis
if [ "$memory_alert" -eq 1 ]; then
    echo ""
    echo "[ANALYSIS] Top memory-consuming processes:"
    ps aux --sort=-%mem | head -6

    echo ""
    echo "[ROOT CAUSE]"
    echo "Possible causes:"
    echo "- Memory-intensive applications"
    echo "- Memory leak"
    echo "- Too many concurrent processes"
    echo "- Insufficient system memory"

    echo ""
    echo "[ACTION REQUIRED]"
    echo "Suggested actions:"
    echo "1. Check memory usage: free -m"
    echo "2. Identify processes: ps aux --sort=-%mem | head"
    echo "3. Inspect process: ps -ef | grep <process_name>"
    echo "4. Stop process: kill -9 <PID>"
    echo "5. Monitor swap usage"
    echo "6. Consider scaling memory"
else
    echo ""
    echo "[OK] Memory usage is normal"
fi

echo ""
echo "[VALIDATION]"
free -m

echo ""
echo "======================================"
echo "          CHECK COMPLETED             "
echo "======================================"