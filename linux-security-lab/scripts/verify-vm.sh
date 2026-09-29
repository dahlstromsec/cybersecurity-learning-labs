#!/bin/bash

# Linux Security Lab - VM Verification
# Read-only PASS/FAIL checker based on the technical requirements
# from the Linux Server Configuration assignment.
#
# This script does NOT:
# - upload anything
# - submit anything
# - calculate a school grade
# - contain passwords
# - modify the VM configuration

PASS_COUNT=0
FAIL_COUNT=0

pass() {
    echo "[PASS] $1"
    ((PASS_COUNT++))
}

fail() {
    echo "[FAIL] $1"
    ((FAIL_COUNT++))
}

check() {
    local description="$1"
    shift

    if "$@" >/dev/null 2>&1; then
        pass "$description"
    else
        fail "$description"
    fi
}

echo "=========================================="
echo " Linux Security Lab - VM Verification"
echo "=========================================="
echo

# --------------------------------------------------
# Preconditions
# --------------------------------------------------

if [[ $EUID -ne 0 ]]; then
    echo "[ERROR] Run this script as root."
    exit 1
fi

# --------------------------------------------------
# VM resources
# --------------------------------------------------

check "RAM is approximately 4 GB" bash -c '
    ram_mb=$(awk "/MemTotal/ {print int(\$2/1024)}" /proc/meminfo)
    (( ram_mb >= 3800 && ram_mb <= 4200 ))
'

check "CPU count is 4" bash -c '
    [[ "$(nproc)" -eq 4 ]]
'

check "Root filesystem is approximately 7 GiB" bash -c '
    size=$(findmnt -no SIZE /)
    size_mb=$(numfmt --from=iec "$size" 2>/dev/null | awk "{print int(\$1/1024/1024)}")
    (( size_mb >= 6500 && size_mb <= 7500 ))
'

check "Home filesystem is approximately 2.5 GiB" bash -c '
    size=$(findmnt -no SIZE /home)
    size_mb=$(numfmt --from=iec "$size" 2>/dev/null | awk "{print int(\$1/1024/1024)}")
    (( size_mb >= 2200 && size_mb <= 2800 ))
'

check "Total disk is approximately 10 GB" bash -c '
    size=$(lsblk -bndo SIZE | head -n1)
    size_gb=$((size / 1000 / 1000 / 1000))
    (( size_gb >= 9 && size_gb <= 11 ))
'

# --------------------------------------------------
# System configuration
# --------------------------------------------------

check "Hostname is configured" bash -c '
    [[ -n "$(hostname)" ]]
'

check "English US locale is configured" bash -c '
    locale | grep -q "LANG=en_US.UTF-8"
'

check "Swedish keyboard layout is configured" bash -c '
    localectl status | grep -Eiq "(X11 Layout:.*se|VC Keymap:.*sv|VC Keymap:.*se)"
'

check "Timezone is Europe/Stockholm" bash -c '
    [[ "$(timedatectl show -p Timezone --value)" == "Europe/Stockholm" ]]
'

check "DNS server 1.1.1.1 is configured" bash -c '
    grep -Eq "^[[:space:]]*nameserver[[:space:]]+1\.1\.1\.1" /etc/resolv.conf
'

check "SELinux is enforcing" bash -c '
    command -v getenforce >/dev/null &&
    [[ "$(getenforce)" == "Enforcing" ]]
'

check "No swap is configured" bash -c '
    [[ -z "$(swapon --show --noheadings)" ]]
'

# --------------------------------------------------
# Disk configuration
# --------------------------------------------------

check "Root filesystem uses ext4" bash -c '
    [[ "$(findmnt -no FSTYPE /)" == "ext4" ]]
'

check "Root filesystem label is root" bash -c '
    [[ "$(findmnt -no SOURCE /)" != "" ]] &&
    lsblk -no LABEL "$(findmnt -no SOURCE /)" | grep -qx "root"
'

check "Home filesystem uses XFS" bash -c '
    [[ "$(findmnt -no FSTYPE /home)" == "xfs" ]]
'

check "Home filesystem label is home" bash -c '
    [[ "$(findmnt -no SOURCE /home)" != "" ]] &&
    lsblk -no LABEL "$(findmnt -no SOURCE /home)" | grep -qx "home"
'

# --------------------------------------------------
# Required packages
# --------------------------------------------------

check "nmap is installed" rpm -q nmap
check "openssh-server-config-rootlogin is installed" rpm -q openssh-server-config-rootlogin
check "expect is installed" rpm -q expect
check "hostname is installed" rpm -q hostname

check "Package count is 850 or fewer" bash -c '
    count=$(rpm -qa | wc -l)
    (( count <= 850 ))
'

# --------------------------------------------------
# SSH service
# --------------------------------------------------

check "sshd service exists" systemctl cat sshd.service
check "sshd service is enabled" systemctl is-enabled sshd.service
check "sshd service is running" systemctl is-active sshd.service

check "sshd listens on port 4444" bash -c '
    ss -ltn | grep -Eq "(:4444[[:space:]]|:4444$)"
'

check "SSH port 22 is not listening" bash -c '
    ! ss -ltn | grep -Eq "(:22[[:space:]]|:22$)"
'

# --------------------------------------------------
# Effective SSH configuration
# --------------------------------------------------

check "SSH port is configured as 4444" bash -c '
    sshd -T | grep -qx "port 4444"
'

check "Public-key authentication is enabled" bash -c '
    sshd -T | grep -qi "^pubkeyauthentication yes$"
'

check "Keyboard-interactive authentication is disabled" bash -c '
    sshd -T | grep -qi "^kbdinteractiveauthentication no$"
'

check "Root password authentication is enabled" bash -c '
    sshd -T -C user=root,host=localhost,addr=127.0.0.1 |
        grep -qi "^passwordauthentication yes$"
'

check "db password authentication is enabled" bash -c '
    sshd -T -C user=db,host=localhost,addr=127.0.0.1 |
        grep -qi "^passwordauthentication yes$"
'

check "safe password authentication is disabled" bash -c '
    sshd -T -C user=safe,host=localhost,addr=127.0.0.1 |
        grep -qi "^passwordauthentication no$"
'

# --------------------------------------------------
# SELinux SSH port
# --------------------------------------------------

check "SELinux allows SSH on port 4444" bash -c '
    semanage port -l 2>/dev/null |
        grep -Eq "^ssh_port_t[[:space:]]+tcp[[:space:]].*4444"
'

# --------------------------------------------------
# safe SSH key configuration
# --------------------------------------------------

check "safe user exists" id safe

check "safe .ssh directory exists" bash -c '
    [[ -d /home/safe/.ssh ]]
'

check "safe authorized_keys exists" bash -c '
    [[ -f /home/safe/.ssh/authorized_keys ]]
'

check "authorized_keys is owned by safe" bash -c '
    [[ "$(stat -c "%U" /home/safe/.ssh/authorized_keys)" == "safe" ]]
'

check "authorized_keys has mode 600" bash -c '
    [[ "$(stat -c "%a" /home/safe/.ssh/authorized_keys)" == "600" ]]
'

check "safe private key exists" bash -c '
    [[ -f /home/safe/.ssh/id_ed25519 ]]
'

check "safe public key exists" bash -c '
    [[ -f /home/safe/.ssh/id_ed25519.pub ]]
'

# --------------------------------------------------
# Test safe SSH key login
# --------------------------------------------------

check "safe can authenticate using SSH key" bash -c '
    su - safe -c "
        ssh \
          -o BatchMode=yes \
          -o StrictHostKeyChecking=no \
          -o UserKnownHostsFile=/dev/null \
          -o PreferredAuthentications=publickey \
          -o PasswordAuthentication=no \
          -o KbdInteractiveAuthentication=no \
          -p 4444 safe@localhost exit
    "
'

# --------------------------------------------------
# Firewall
# --------------------------------------------------

check "firewalld is running" systemctl is-active firewalld

check "public firewall zone exists" firewall-cmd --get-zones

check "public is the default firewall zone" bash -c '
    [[ "$(firewall-cmd --get-default-zone)" == "public" ]]
'

check "4444/tcp is allowed in public zone" bash -c '
    firewall-cmd --zone=public --list-ports |
        tr " " "\n" |
        grep -qx "4444/tcp"
'

check "4444/tcp is permanently allowed in public zone" bash -c '
    firewall-cmd --permanent --zone=public --list-ports |
        tr " " "\n" |
        grep -qx "4444/tcp"
'

# --------------------------------------------------
# Users and groups
# --------------------------------------------------

check "db user exists" id db
check "safe user exists" id safe
check "developers group exists" getent group developers

check "db belongs to wheel" bash -c '
    id -nG db | tr " " "\n" | grep -qx wheel
'

check "db belongs to developers" bash -c '
    id -nG db | tr " " "\n" | grep -qx developers
'

check "safe belongs to developers" bash -c '
    id -nG safe | tr " " "\n" | grep -qx developers
'

check "safe does not belong to wheel" bash -c '
    ! id -nG safe | tr " " "\n" | grep -qx wheel
'

# --------------------------------------------------
# Privilege separation
# --------------------------------------------------

check "db has sudo authorization" bash -c '
    sudo -l -U db 2>/dev/null |
        grep -Eq "\(ALL(: ALL)?\)[[:space:]]+ALL"
'

check "safe is not authorized for sudo" bash -c '
    ! sudo -l -U safe 2>/dev/null |
        grep -Eq "\(ALL(: ALL)?\)[[:space:]]+ALL"
'

check "safe cannot execute sudo without authorization" bash -c '
    su - safe -c "sudo -n true" >/dev/null 2>&1
    [[ $? -ne 0 ]]
'

check "safe cannot become root using su without authentication" bash -c '
    su - safe -c "su -c id </dev/null" >/dev/null 2>&1
    [[ $? -ne 0 ]]
'

check "db is in wheel for su authorization" bash -c '
    id -nG db | tr " " "\n" | grep -qx wheel
'

# --------------------------------------------------
# hello_world.txt
# --------------------------------------------------

FILE="/home/safe/hello_world.txt"

check "hello_world.txt exists" bash -c '
    [[ -f /home/safe/hello_world.txt ]]
'

check "hello_world.txt contains Hello world." bash -c '
    [[ "$(cat /home/safe/hello_world.txt)" == "Hello world." ]]
'

check "hello_world.txt is owned by safe" bash -c '
    [[ "$(stat -c "%U" /home/safe/hello_world.txt)" == "safe" ]]
'

check "hello_world.txt group is developers" bash -c '
    [[ "$(stat -c "%G" /home/safe/hello_world.txt)" == "developers" ]]
'

check "hello_world.txt has mode 710" bash -c '
    [[ "$(stat -c "%a" /home/safe/hello_world.txt)" == "710" ]]
'

check "safe can read hello_world.txt" bash -c '
    sudo -u safe test -r /home/safe/hello_world.txt
'

check "safe can write hello_world.txt" bash -c '
    sudo -u safe test -w /home/safe/hello_world.txt
'

check "safe can execute hello_world.txt" bash -c '
    sudo -u safe test -x /home/safe/hello_world.txt
'

check "db can read hello_world.txt" bash -c '
    sudo -u db test -r /home/safe/hello_world.txt
'

check "db cannot write hello_world.txt" bash -c '
    ! sudo -u db test -w /home/safe/hello_world.txt
'

check "db cannot execute hello_world.txt" bash -c '
    ! sudo -u db test -x /home/safe/hello_world.txt
'

# --------------------------------------------------
# Network connectivity
# --------------------------------------------------

check "Internet connectivity works" bash -c '
    ping -c 1 -W 3 www.svd.se >/dev/null 2>&1
'

# --------------------------------------------------
# Summary
# --------------------------------------------------

echo
echo "=========================================="
echo " Verification Summary"
echo "=========================================="
echo "Passed: $PASS_COUNT"
echo "Failed: $FAIL_COUNT"
echo

if [[ $FAIL_COUNT -eq 0 ]]; then
    echo "RESULT: PASS"
    exit 0
else
    echo "RESULT: FAIL"
    exit 1
fi
