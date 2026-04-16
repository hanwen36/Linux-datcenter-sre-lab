#!/bin/bash

echo "=============================="
echo "   Disk Monitoring Tool v5"
echo "=============================="

echo ""
echo "[INFO] Checking disk usage..."

df -h | grep '^/dev/' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    mount=$(echo $line | awk '{print $6}')

    echo ""
    echo "[INFO] Mount: $mount | Usage: $usage%"

    if [ "$usage" -gt 80 ]; then
        echo "[WARNING] High disk usage detected on $mount"

        echo ""
        echo "[ANALYSIS] Top files in $mount:"
        du -ah $mount 2>/dev/null | sort -rh | head -5

        echo ""
        echo "[ROOT CAUSE]"
        du -ah $mount 2>/dev/null | sort -rh | head -1

        echo ""
        echo "[SUGGESTION]"
        echo "- Remove unnecessary large files"
        echo "- Check log files"
        echo "- Clean temp directories"

    else
        echo "[OK] Disk usage is normal"
    fi
done

echo ""
echo "=============================="
echo "Check completed"
echo "=============================="
