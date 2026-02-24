#!/bin/bash

# -----------------------------------------
# Script Name: q1_system_info.sh
# Purpose: Display system information
# -----------------------------------------

echo "===== SYSTEM INFORMATION ====="

# Hostname
echo "Hostname: $(hostname)"

# Current user
echo "Logged in User: $(whoami)"

# Current date and time
echo "Date & Time: $(date)"

# Uptime
echo "System Uptime:"
uptime

# OS Information
echo "Operating System:"
lsb_release -a 2>/dev/null

# Kernel Version
echo "Kernel Version: $(uname -r)"

# CPU Info
echo "CPU Info:"
lscpu | grep "Model name"

# Memory Info
echo "Memory Usage:"
free -h

# Disk Usage
echo "Disk Usage:"
df -h

echo "===== END ====="
