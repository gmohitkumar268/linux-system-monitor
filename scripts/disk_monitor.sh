
#!/bin/bash

# Disk Monitoring Module

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

source "$PROJECT_DIR/config/monitor.conf"

monitor_disk() {

    echo ""
    echo "Disk Usage:"

    df -h /

    DISK_USAGE=$(df / | awk 'NR==2 {
        gsub("%","",$5);
        print $5
    }')

    if [[ "$DISK_USAGE" =~ ^[0-9]+$ ]]; then

        echo "Disk Usage: ${DISK_USAGE}%"

        if [ "$DISK_USAGE" -ge "$DISK_CRITICAL_THRESHOLD" ]; then
            echo "WARNING: Critical disk usage!"

        elif [ "$DISK_USAGE" -ge "$DISK_WARNING_THRESHOLD" ]; then
            echo "WARNING: Disk usage is high!"

        else
            echo "Disk Status: Normal"
        fi

    else
        echo "WARNING: Unable to determine disk usage."
    fi
}

monitor_disk

