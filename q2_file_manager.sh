#!/bin/bash

# -----------------------------------------
# Script Name: q2_file_manager.sh
# Purpose: Menu-driven File & Directory Manager
# -----------------------------------------

while true
do
    echo "===== FILE MANAGER ====="
    echo "1. Create File"
    echo "2. Delete File"
    echo "3. Create Directory"
    echo "4. Delete Directory"
    echo "5. List Files"
    echo "6. Exit"
    echo "Enter your choice:"
    read choice

    case $choice in
        1)
            echo "Enter file name:"
            read filename
            touch "$filename"
            echo "File created successfully."
            ;;
        2)
            echo "Enter file name to delete:"
            read filename
            rm -i "$filename"
            ;;
        3)
            echo "Enter directory name:"
            read dirname
            mkdir "$dirname"
            echo "Directory created successfully."
            ;;
        4)
            echo "Enter directory name to delete:"
            read dirname
            rm -r "$dirname"
            ;;
        5)
            echo "Files in current directory:"
            ls -l
            ;;
        6)
            echo "Exiting File Manager..."
            break
            ;;
        *)
            echo "Invalid choice. Try again."
            ;;
    esac

    echo ""
done
