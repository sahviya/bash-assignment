#!/bin/bash

# -----------------------------------------
# Script Name: q4_backup.sh
# Purpose: Create a backup of a directory with timestamp
# -----------------------------------------

echo "Enter the directory path to backup:"
read source

# Check if directory exists
if [ ! -d "$source" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Create timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Backup file name
backup_name="backup_${timestamp}.tar.gz"

# Create compressed backup
tar -czf "$backup_name" "$source"

echo "Backup created successfully!"
echo "Backup file: $backup_name"
