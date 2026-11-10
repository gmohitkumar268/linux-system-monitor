
# Linux System Monitoring Tool

A modular Linux system monitoring tool built using Bash scripting. It monitors CPU, RAM, disk usage, system uptime, and top resource-consuming processes. Monitoring reports are automatically saved to a log file.

## Features

- **CPU Monitoring:** Displays CPU usage and warning/critical alerts.
- **Memory Monitoring:** Displays RAM usage and warning/critical alerts.
- **Disk Monitoring:** Tracks disk usage and provides threshold-based alerts.
- **System Uptime:** Displays system running time.
- **Process Monitoring:** Lists the top 5 CPU-consuming processes.
- **Configurable Thresholds:** Customize warning and critical limits.
- **Automatic Logging:** Saves monitoring reports with timestamps.
- **Cron Automation:** Runs automatically every 5 minutes.

## Technologies Used

- Linux (Ubuntu on WSL2)
- Bash Shell Scripting
- Cron
- `mpstat`, `free`, `df`, `ps`, `uptime`
- Git and GitHub

## Project Structure

```text
linux-system-monitor/
├── monitor.sh
├── README.md
├── .gitignore
├── config/
│   └── monitor.conf
├── logs/
└── scripts/
    ├── cpu_monitor.sh
    ├── memory_monitor.sh
    ├── disk_monitor.sh
    ├── uptime_monitor.sh
    └── process_monitor.sh
```

## Requirements

- Ubuntu or another compatible Linux distribution
- Bash
- sysstat
- Cron

## Installation

Clone the repository:

```bash
git clone https://github.com/gmohitkumar268/linux-system-monitor.git
```

Navigate to the project:

```bash
cd linux-system-monitor
```

Install dependencies:

```bash
sudo apt update
sudo apt install sysstat cron
```

Make the main script executable:

```bash
chmod +x monitor.sh
```

## Configuration

Edit the configuration file:

```bash
nano config/monitor.conf
```

Default thresholds:

| Resource | Warning | Critical |
|---|---:|---:|
| CPU | 70% | 90% |
| RAM | 70% | 90% |
| Disk | 70% | 90% |

## Run the Project

```bash
./monitor.sh
```

## View Monitoring Logs

```bash
tail -f logs/system-monitor.log
```

## Automate Using Cron

Open the Cron editor:

```bash
crontab -e
```

Add the following entry, replacing the path with your actual project path:

```bash
*/5 * * * * /YOUR/PROJECT/PATH/monitor.sh >/dev/null 2>&1
```

This runs the monitoring script every five minutes.

## Learning Outcomes

- Linux command-line operations
- Bash scripting and modular programming
- CPU, RAM and disk monitoring
- Configuration management
- File handling and logging
- Cron job scheduling
- Linux system automation
- Git and GitHub version control

## Future Improvements

- Email notifications for critical alerts
- Log rotation
- Improved error handling
- Monitoring dashboard

---

**Author:** Mohit Kumar Gupta

**Project:** Linux System Monitoring Tool

