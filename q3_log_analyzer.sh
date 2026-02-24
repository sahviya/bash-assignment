#!/bin/bash

# -----------------------------------------
# Script Name: q3_log_analyzer.sh
# Purpose: Analyze a log file and show statistics
# -----------------------------------------

echo "Enter the log file path:"
read logfile

# Check if file exists
if [ ! -f "$logfile" ]; then
    echo "File does not exist!"
    exit 1
fi

echo "===== LOG ANALYSIS ====="

# Total lines
echo "Total Lines: $(wc -l < "$logfile")"

# Count of errors
echo "Error Count: $(grep -i "error" "$logfile" | wc -l)"

# Count of warnings
echo "Warning Count: $(grep -i "warning" "$logfile" | wc -l)"

# Unique IP addresses
echo "Unique IP Addresses:"
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$logfile" | sort | uniq | wc -l

echo "===== END ====="
