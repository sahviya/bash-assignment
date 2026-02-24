#!/bin/bash

# -----------------------------------------
# Script Name: q2_file_manager.sh
# Purpose: Advanced File & Directory Manager
# -----------------------------------------

while true
do
    echo "================================="
    echo "      FILE & DIRECTORY MANAGER"
    echo "================================="
    echo "1. List files in current directory"
    echo "2. Create a new directory"
    echo "3. Create a new file"
    echo "4. Delete a file"
    echo "5. Rename a file"
    echo "6. Search for a file"
    echo "7. Count files and directories"
    echo "8. Exit"
    echo "Enter your choice:"
    read choice

    case $choice in

        1)
            echo "Listing files..."
            ls -lh
            ;;

        2)
            echo "Enter directory name:"
            read dirname
            if [ -d "$dirname" ]; then
                echo "Directory already exists!"
            else
                mkdir "$dirname"
                echo "Directory created successfully."
            fi
            ;;

        3)
            echo "Enter file name:"
            read filename
            if [ -f "$filename" ]; then
                echo "File already exists!"
            else
                touch "$filename"
                echo "File created successfully."
            fi
            ;;

        4)
            echo "Enter file name to delete:"
            read filename
            if [ -f "$filename" ]; then
                rm -i "$filename"
            else
                echo "File does not exist!"
            fi
            ;;

        5)
            echo "Enter old file name:"
            read oldname
            if [ -f "$oldname" ]; then
                echo "Enter new file name:"
                read newname
                mv "$oldname" "$newname"
                echo "File renamed successfully."
            else
                echo "File does not exist!"
            fi
            ;;

        6)
            echo "Enter file name pattern to search:"
            read pattern
            find . -name "*$pattern*"
            ;;

        7)
            echo "Counting files and directories..."
            echo "Files: $(find . -type f | wc -l)"
            echo "Directories: $(find . -type d | wc -l)"
            ;;

        8)
            echo "Exiting..."
            break
            ;;

        *)
            echo "Invalid choice! Please enter 1-8."
            ;;

    esac

    echo ""
done
