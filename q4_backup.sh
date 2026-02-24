#!/bin/bash

echo "=== AUTOMATED BACKUP SCRIPT ==="

# Record start time
START=$(date +%s)

# 1️⃣ Ask source directory
echo "Enter directory to backup:"
read SOURCE

# Validate source
if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory does not exist!"
    exit 1
fi

# 2️⃣ Ask destination
echo "Enter backup destination:"
read DEST

# Create destination if not exists
mkdir -p "$DEST"

# 3️⃣ Backup type
echo "Backup Type:"
echo "1. Simple copy"
echo "2. Compressed archive (tar.gz)"
echo "Enter choice:"
read CHOICE

# Create timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "[*] Starting backup..."
echo "[*] Source: $SOURCE"
echo "[*] Destination: $DEST"

if [ "$CHOICE" -eq 1 ]; then
    BACKUP_NAME="backup_$TIMESTAMP"
    cp -r "$SOURCE" "$DEST/$BACKUP_NAME"
    
elif [ "$CHOICE" -eq 2 ]; then
    BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
    tar -czf "$DEST/$BACKUP_NAME" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
    
else
    echo "Invalid choice!"
    exit 1
fi

# Check if backup successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
else
    echo "Backup failed!"
    exit 1
fi

# Record end time
END=$(date +%s)
DURATION=$((END - START))

# Get size
SIZE=$(du -sh "$DEST/$BACKUP_NAME" | awk '{print $1}')

echo ""
echo "Backup Details:"
echo "File: $BACKUP_NAME"
echo "Location: $DEST"
echo "Size: $SIZE"
echo "Time taken: $DURATION seconds"
