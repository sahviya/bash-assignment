# 🐧 Bash Scripting Assignment

This repository contains solutions for the CampusPe Bash Scripting Assignment.
All scripts were developed and tested on Ubuntu Linux.

---

## 📌 Scripts Overview

### 1️⃣ q1_system_info.sh — System Information Display

Displays formatted system information including:

- Current username
- Hostname
- Current date & time
- Operating system name
- Current working directory
- Home directory
- Number of logged-in users
- System uptime

---

### 2️⃣ q2_file_manager.sh — File & Directory Manager

Interactive menu-driven script that allows:

- Listing files (`ls -lh`)
- Creating directories
- Creating files
- Deleting files (with confirmation)
- Renaming files
- Searching files using `find`
- Counting files and directories

Uses:
- `while` loop
- `case` statement
- Input validation
- File existence checks

---

### 3️⃣ q3_log_analyzer.sh — Log File Analyzer

Analyzes web server log files and generates statistics:

- Total number of log entries
- Unique IP addresses
- Status code summary (200, 404, 403, etc.)
- Most frequently accessed page
- Top 3 IP addresses by request count

**Usage:**

```bash
./q3_log_analyzer.sh access.log
```

Features:
- Argument validation
- File existence check
- Empty file handling
- Uses `awk`, `sort`, `uniq`, `wc`

---

### 4️⃣ q4_backup.sh — Automated Backup Script

Creates backups of directories with user selection.

Features:

- Select source directory
- Select backup destination
- Choose backup type:
  - Simple copy (`cp -r`)
  - Compressed archive (`tar -czf`)
- Timestamped backup naming:
  ```
  backup_YYYYMMDD_HHMMSS.tar.gz
  ```
- Backup verification
- Displays:
  - File name
  - Location
  - Size (`du -sh`)
  - Time taken

---

### 5️⃣ q5_user_report.sh — User Account Reporter

Generates a detailed report of system users.

Includes:

#### 🔹 User Statistics
- Total users
- System users (UID < 1000)
- Regular users (UID ≥ 1000)
- Currently logged-in users

#### 🔹 User Details Table
- Username
- UID
- Home directory
- Default shell
- Last login time

#### 🔹 Group Information
- Lists all groups
- Displays member count per group

#### 🔹 Security Checks
- Users with UID 0 (root privileges)
- Users without passwords
- Users who never logged in

Uses:
- `/etc/passwd`
- `/etc/group`
- `/etc/shadow`
- `awk`, `who`, `lastlog`

---

## 🚀 How to Run

1️⃣ Make script executable:

```bash
chmod +x script_name.sh
```

2️⃣ Run the script:

```bash
./script_name.sh
```

Example:

```bash
./q1_system_info.sh
./q2_file_manager.sh
./q3_log_analyzer.sh access.log
./q4_backup.sh
./q5_user_report.sh
```

---

## 🛠 Technologies Used

- Bash Shell Scripting
- Ubuntu Linux
- Core Linux Utilities:
  - `awk`
  - `grep`
  - `sort`
  - `uniq`
  - `tar`
  - `du`
  - `wc`
  - `who`
  - `lastlog`

---

## 📅 Submission Details

Course: Cyber Security  
Platform: Ubuntu Linux  
Assignment: CampusPe Bash Scripting Assignment  

---

## 👩‍💻 Author

GitHub: https://github.com/sahviya

---

