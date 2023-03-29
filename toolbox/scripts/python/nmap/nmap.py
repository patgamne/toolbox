#!/bin/python3

import subprocess

# Prompt the user for a wordlist file
wordlist = input("Enter path to wordlist file: ")

# Open the file containing IP addresses
with open("/home/kali/gitclone/toolbox/ip.txt") as f:
    # Iterate over each IP address in the file
    for ip in f:
        # Strip any whitespace from the IP address
        ip = ip.strip()
        # Build the Nmap command to scan the current IP address with the specified wordlist
        cmd = f"nmap -sV -O -v --script http-wordpress-brute --script-args http-wordpress-brute.wordlist={wordlist} {ip}"
        # Launch a new terminal window and execute the Nmap command
        subprocess.call(['xterm', '-e', cmd])

