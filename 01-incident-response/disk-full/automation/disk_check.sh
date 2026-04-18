
#!/bin/bash

echo "=========================="
echo "   Disk Monitoring Tool   "
echo "=========================="
date

echo ""
echo "[INFO} Checking disk usage..."

df -h | grep '^/dev/' | while read line; do
    usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')
    mount=$(echo "$line" | awk '{print $6}')

    echo ""
    echo "[INFO] Mount: $mount | Usage: $usage$"

    if [ "$usage" -gt 80 ]; then
        echo "[WARNING] High disk usage detected on $mount"

        echo ""
        echo "[ANALYSIS] Top files in $mount:"
        du -ah "$mount" 2>/dev/null | sort -rh | head -5

        root_cause=$(find "$mount" -xdev -type f -exec du -h {} + 2>/dev/null | sort -rh | head -1)

        echo ""
        echo "[ROOT CAUSE]"
        echo "$root_cause"
        file_path=$(echo "$root_cause" | awk '{print $2}')
        file_path=$(echo "$file_path" | xargs)

        echo "{DEBUG} file_path: $file_path"

        if [ -n "$file_path" ]; then
            echo ""
            echo "[ACTION REQUIRED]"
            read -p "Do you want to delete this file? $file_path (y/n): " answer < /dev/tty

            if [ "$answer" = "y" ]; then
                rm -f "$file_path"
                echo "[DONE] File deleted: $file_path"

                echo ""
                echo "[VALIDATION] Checking disk usage again..."
                df -h | grep '^/dev/'
            else
                echo "[SkIPPED] No file deleted"
            fi

        else
            echo "[info] NO REMOVABLE FILE IDENTIFIED"
        fi

    else
        echo "[OK] Disk usage is normal"
    fi

done
echo ""
echo "=============================="
echo "       CHECK COMPLETED        "
echo "=============================="

