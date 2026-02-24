#!/bin/bash

echo "====================================="
echo "        USER ACCOUNT REPORT"
echo "====================================="

PASSWD_FILE="/etc/passwd"
GROUP_FILE="/etc/group"

# =============================
# 1️⃣ USER STATISTICS
# =============================

TOTAL_USERS=$(wc -l < $PASSWD_FILE)
SYSTEM_USERS=$(awk -F: '$3 < 1000 {count++} END {print count}' $PASSWD_FILE)
REGULAR_USERS=$(awk -F: '$3 >= 1000 {count++} END {print count}' $PASSWD_FILE)
CURRENT_LOGGED=$(who | awk '{print $1}' | sort -u | wc -l)

echo ""
echo "=== USER STATISTICS ==="
echo "Total Users: $TOTAL_USERS"
echo "System Users (UID < 1000): $SYSTEM_USERS"
echo "Regular Users (UID >= 1000): $REGULAR_USERS"
echo "Currently Logged In: $CURRENT_LOGGED"

# =============================
# 2️⃣ USER DETAILS TABLE
# =============================

echo ""
echo "=== REGULAR USER DETAILS ==="
printf "%-15s %-8s %-20s %-15s %-20s\n" "Username" "UID" "Home Directory" "Shell" "Last Login"
printf "%-15s %-8s %-20s %-15s %-20s\n" "--------" "---" "--------------" "-----" "----------"

awk -F: '$3 >= 1000 {print $1 ":" $3 ":" $6 ":" $7}' $PASSWD_FILE | while IFS=: read USER UID HOME SHELL
do
    LAST_LOGIN=$(lastlog -u $USER | awk 'NR==2 {print $4, $5, $6, $7}')
    if [ -z "$LAST_LOGIN" ]; then
        LAST_LOGIN="Never logged in"
    fi

    printf "%-15s %-8s %-20s %-15s %-20s\n" "$USER" "$UID" "$HOME" "$SHELL" "$LAST_LOGIN"
done

# =============================
# 3️⃣ GROUP INFORMATION
# =============================

echo ""
echo "=== GROUP INFORMATION ==="
awk -F: '
{
    group=$1
    members=$4
    if (members=="") {
        count=0
    } else {
        count=split(members, arr, ",")
    }
    print group " - Members: " count
}' $GROUP_FILE

# =============================
# 4️⃣ SECURITY CHECK
# =============================

echo ""
echo "=== SECURITY ALERTS ==="

# Users with UID 0
ROOT_USERS=$(awk -F: '$3 == 0 {print $1}' $PASSWD_FILE)
echo "Users with root privileges (UID 0):"
echo "$ROOT_USERS"

# Users without passwords (empty password field in /etc/shadow)
NO_PASS=$(awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null)

if [ -z "$NO_PASS" ]; then
    echo "All users have passwords set."
else
    echo "Users without passwords:"
    echo "$NO_PASS"
fi

# Users who never logged in
echo ""
echo "Users who never logged in:"
lastlog | awk 'NR>1 && $4=="**Never" {print $1}'

echo ""
echo "============= END OF REPORT ============="
