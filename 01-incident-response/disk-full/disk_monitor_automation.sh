#!/bin/bash

echo "Checking disk usage..."

usage=$(df -h | grep '/dev/sda2' | awk '{print $5}' | sed 's/%//')

echo "Disk usage: $usage%"

if [ "$usage" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%"

    echo
    echo "Checking key directories..."

    du -sh /var/log 2>/dev/null
    du -sh /tmp 2>/dev/null
    du -sh /home 2>/dev/null

    echo
    echo "Top files in /var/log:"
    du -ah /var/log 2>/dev/null | sort -rh | head -5

    echo
    echo "Top files in /tmp:"
    du -ah /tmp 2>/dev/null | sort -rh | head -5

    echo
    echo "Top files in /home:"
    du -ah /home 2>/dev/null | sort -rh | head -5

else
    echo "Disk usage is normal"
fi
