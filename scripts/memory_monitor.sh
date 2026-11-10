#!/bin/bash

# Memory Monitoring Module

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

source "$PROJECT_DIR/config/monitor.conf"

monitor_memory() {

    echo ""
    echo "Memory Usage:"

    if command -v free >/dev/null 2>&1; then

        free -h

        RAM_USAGE=$(free | awk '/Mem:/ {
            printf "%.0f", ($3/$2)*100
        }')

        if [[ "$RAM_USAGE" =~ ^[0-9]+$ ]]; then

            echo "RAM Usage: ${RAM_USAGE}%"

            if [ "$RAM_USAGE" -ge "$RAM_CRITICAL_THRESHOLD" ]; then
                echo "WARNING: Critical RAM usage!"

            elif [ "$RAM_USAGE" -ge "$RAM_WARNING_THRESHOLD" ]; then
                echo "WARNING: RAM usage is high!"

            else
                echo "RAM Status: Normal"
            fi

        else
            echo "WARNING: Unable to determine RAM usage."
        fi

    else
        echo "WARNING: free command is not available."
    fi
}

monitor_memory
