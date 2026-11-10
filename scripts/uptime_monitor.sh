
#!/bin/bash

# System Uptime Monitoring Module

monitor_uptime() {

    echo ""
    echo "System Uptime:"

    if command -v uptime >/dev/null 2>&1; then
        uptime
    else
        echo "WARNING: uptime command is not available."
    fi
}

monitor_uptime

