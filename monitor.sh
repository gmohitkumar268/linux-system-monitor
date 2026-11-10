
#!/bin/bash

# Linux System Monitoring Tool - Main Controller

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR" || exit 1

# Load configuration
source "$PROJECT_DIR/config/monitor.conf"

# Create log directory if missing
mkdir -p "$PROJECT_DIR/logs"

# Resolve log file path
LOG_FILE="$PROJECT_DIR/$LOG_FILE"

# Execute monitoring modules and save report
{
    echo ""
    echo "========== SYSTEM MONITOR REPORT =========="
    echo "Date: $(date)"
    echo "============================================"

    echo ""
    echo "Hostname:"
    hostname

    # CPU Monitoring
    bash "$PROJECT_DIR/scripts/cpu_monitor.sh"

    # Memory Monitoring
    bash "$PROJECT_DIR/scripts/memory_monitor.sh"

    # Disk Monitoring
    bash "$PROJECT_DIR/scripts/disk_monitor.sh"

    # Uptime Monitoring
    bash "$PROJECT_DIR/scripts/uptime_monitor.sh"

    # Process Monitoring
    bash "$PROJECT_DIR/scripts/process_monitor.sh"

    echo ""
    echo "============================================"
    echo "Monitoring Completed!"
    echo "============================================"

} | tee -a "$LOG_FILE"

