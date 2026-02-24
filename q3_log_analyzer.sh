#!/bin/bash

# -----------------------------------------
# Script Name: q3_log_analyzer.sh
# Purpose: Analyze web server log file
# -----------------------------------------

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: ./q3_log_analyzer.sh <logfile>"
    exit 1
fi

LOGFILE=$1

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check if file is empty
if [ ! -s "$LOGFILE" ]; then
    echo "Error: Log file is empty."
    exit 1
fi

echo "=== LOG FILE ANALYSIS ==="
echo "Log File: $LOGFILE"

# Total entries
TOTAL=$(wc -l < "$LOGFILE")
echo "Total Entries: $TOTAL"

# Unique IP addresses
echo ""
echo "Unique IP Addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq | tee /tmp/ip_list.txt
UNIQUE_COUNT=$(wc -l < /tmp/ip_list.txt)
echo "Total Unique IPs: $UNIQUE_COUNT"

# Status code summary
echo ""
echo "Status Code Summary:"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | awk '{print $2": "$1" requests"}'

# Most frequently accessed page
echo ""
echo "Most Frequently Accessed Page:"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -1

# Top 3 IPs
echo ""
echo "Top 3 IP Addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -3 | \
awk '{print NR". "$2" - "$1" requests"}'

echo ""
echo "=== END OF REPORT ==="
