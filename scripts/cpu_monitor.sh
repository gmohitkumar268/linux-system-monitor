#!/bin/bash

# CPU Monitoring Module

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

source "$PROJECT_DIR/config/monitor.conf"

monitor_cpu() {

    echo ""
    echo "CPU Usage:"

    if command -v mpstat >/dev/null 2>&1; then

        CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {
            printf "%.0f", 100 - $NF
        }')

        if [[ "$CPU_USAGE" =~ ^[0-9]+$ ]]; then

            echo "CPU Usage: ${CPU_USAGE}%"

            if [ "$CPU_USAGE" -ge "$CPU_CRITICAL_THRESHOLD" ]; then
                echo "WARNING: Critical CPU usage!"

            elif [ "$CPU_USAGE" -ge "$CPU_WARNING_THRESHOLD" ]; then
                echo "WARNING: CPU usage is high!"

            else
                echo "CPU Status: Normal"
            fi

        else
            echo "WARNING: Unable to determine CPU usage."
        fi

    else
        echo "WARNING: mpstat is not installed."
    fi
}

monitor_cpu
