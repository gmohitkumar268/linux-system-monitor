
#!/bin/bash

# Process Monitoring Module

monitor_processes() {

    echo ""
    echo "Top 5 CPU Consuming Processes:"

    if command -v ps >/dev/null 2>&1; then

        ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

    else
        echo "WARNING: ps command is not available."
    fi
}

monitor_processes

