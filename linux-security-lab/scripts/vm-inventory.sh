#!/bin/bash

# Linux Security Lab - VM Inventory
#
# Read-only inventory and verification script.
# This script does not modify system configuration.

echo "=================================================="
echo " Linux VM Security Lab - System Inventory"
echo "=================================================="

echo
echo "### SYSTEM"
echo "--------------------------------------------------"
hostname
cat /etc/os-release
uname -a

echo
echo "### HARDWARE / RESOURCES"
echo "--------------------------------------------------"
echo "--- Memory ---"
free -h

echo "--- CPU ---"
nproc
lscpu | grep -E '^(CPU\(s\)|Model name|Architecture):'

echo "--- Disk / Partitions ---"
lsblk -f

echo "--- Filesystem Usage ---"
df -h

echo "--- Swap ---"
swapon --show

echo
echo "### NETWORK"
echo "--------------------------------------------------"
echo "--- Interfaces ---"
ip addr

echo "--- Routing ---"
ip route

echo "--- DNS ---"
cat /etc/resolv.conf

echo
echo "### SELINUX"
echo "--------------------------------------------------"
getenforce
sestatus

echo "--- SELinux SSH ports ---"
sudo semanage port -l | grep ssh_port_t

echo
echo "### SSH"
echo "--------------------------------------------------"
echo "--- Service status ---"
systemctl status sshd --no-pager -l

echo "--- Listening ports ---"
ss -ltnp

echo "--- Effective SSH configuration ---"
sudo sshd -T | grep -E \
'^(port|permitrootlogin|pubkeyauthentication|passwordauthentication|kbdinteractiveauthentication)'

echo
echo "### FIREWALL"
echo "--------------------------------------------------"
echo "--- Default zone ---"
sudo firewall-cmd --get-default-zone

echo "--- Active zones ---"
sudo firewall-cmd --get-active-zones

echo "--- Public zone ---"
sudo firewall-cmd --zone=public --list-all

echo "--- Docker zone ---"
sudo firewall-cmd --zone=docker --list-all

echo
echo "### USERS AND GROUPS"
echo "--------------------------------------------------"
echo "--- User accounts ---"
getent passwd root db safe

echo "--- db ---"
id db

echo "--- safe ---"
id safe

echo "--- developers group ---"
getent group developers

echo "--- wheel group ---"
getent group wheel

echo
echo "### SUDO / PRIVILEGES"
echo "--------------------------------------------------"
echo "--- safe sudo configuration ---"
sudo cat /etc/sudoers.d/safe 2>/dev/null || echo "No /etc/sudoers.d/safe"

echo "--- sudo configuration for db ---"
sudo -l -U db

echo "--- sudo configuration for safe ---"
sudo -l -U safe

echo
echo "### SAFE SSH DIRECTORY"
echo "--------------------------------------------------"
sudo ls -la /home/safe/.ssh

echo "--- authorized_keys permissions ---"
sudo ls -l /home/safe/.ssh/authorized_keys

echo "--- key files (metadata only) ---"
sudo stat -c '%A %U %G %n' \
    /home/safe/.ssh/id_ed25519 \
    /home/safe/.ssh/id_ed25519.pub \
    /home/safe/.ssh/authorized_keys 2>/dev/null

echo
echo "### FILE PERMISSIONS"
echo "--------------------------------------------------"
echo "--- /home/safe ---"
ls -ld /home/safe

echo "--- hello_world.txt ---"
ls -l /home/safe/hello_world.txt

echo "--- File contents ---"
cat /home/safe/hello_world.txt

echo
echo "### INSTALLED REQUIRED PACKAGES"
echo "--------------------------------------------------"
rpm -q nmap
rpm -q openssh-server-config-rootlogin
rpm -q expect
rpm -q hostname

echo
echo "### PACKAGE COUNT"
echo "--------------------------------------------------"
echo "Installed packages:"
rpm -qa | wc -l

echo
echo "### NETWORK CONNECTIVITY"
echo "--------------------------------------------------"
echo "--- Default route ---"
ip route | grep default

echo "--- Ping test ---"
ping -c 3 www.svd.se

echo
echo "=================================================="
echo " Inventory complete"
echo "=================================================="
