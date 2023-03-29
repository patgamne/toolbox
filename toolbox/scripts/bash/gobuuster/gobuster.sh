#!/bin/bash

# Prompt the user to enter a website URL
read -p "Enter website URL to scan: " url

# Prompt the user to select a wordlist to use with gobuster
read -p "Enter wordlist path (or leave blank to use default): " wordlist

# Use the gobuster tool to scan the website
if [ -z "$wordlist" ]; then
    gobuster dir  -u "$url" -w /usr/share/wordlists/dirb/common.txt -t 20
else
    gobuster dir  -u "$url" -w "$wordlist" -t 20
fi

