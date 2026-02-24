#!/bin/bash

# -----------------------------------------
# Script Name: q1_system_info.sh
# Purpose: Display system information in formatted style
# -----------------------------------------

# Store values in variables
USERNAME=$(whoami)
HOSTNAME=$(hostname)
DATE_TIME=$(date "+%Y-%m-%d %H:%M:%S")
OS=$(uname -s)
CURRENT_DIR=$(pwd)
HOME_DIR=$HOME
USERS_ONLINE=$(who | wc -l)
UPTIME_INFO=$(uptime -p)

echo "╔══════════════════════════════════════════════╗"
echo "║           SYSTEM INFORMATION DISPLAY        ║"
echo "╠══════════════════════════════════════════════╣"
echo "║ Username      : $USERNAME"
echo "║ Hostname      : $HOSTNAME"
echo "║ Date & Time   : $DATE_TIME"
echo "║ OS            : $OS"
echo "║ Current Dir   : $CURRENT_DIR"
echo "║ Home Dir      : $HOME_DIR"
echo "║ Users Online  : $USERS_ONLINE"
echo "║ Uptime        : $UPTIME_INFO"
echo "╚══════════════════════════════════════════════╝"
