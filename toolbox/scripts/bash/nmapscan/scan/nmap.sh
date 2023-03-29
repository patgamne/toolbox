#!/bin/bash

# Prompt user for IP address
read -p "Enter IP address to scan: " ip_address

# Run Nmap scan on entered IP address
nmap -sV -O "$ip_address" -o /home/kali/gitclone/toolbox/results/nmap/nmap.xml

# Display scan results
echo "Scan complete. Results:"
cat  /home/kali/gitclone/toolbox/results/nmap/nmap.xml

