#!/bin/bash

# -----------------------------------------
# Script Name: q5_user_report.sh
# Purpose: Generate user account report with security checks
# -----------------------------------------

echo "===== USER ACCOUNT REPORT ====="

# Total number of users
echo "Total Users: $(cut -d: -f1 /etc/passwd | wc -l)"

echo ""

# Regular users (UID >= 1000)
echo "Regular Users (UID >= 1000):"
awk -F: '$3 >= 1000 {print $1}' /etc/passwd

echo ""

# Currently logged-in users
echo "Currently Logged-in Users:"
who

echo ""

# Users with sudo privileges
echo "Users with Sudo Access:"
getent group sudo | cut -d: -f4

echo ""

# Last login information (top 5)
echo "Recent Login Activity:"
last -a | head -5

echo ""
echo "===== END OF REPORT ====="
