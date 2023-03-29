#!/bin/bash

if [ -z "$1" ]
then
        read -p "Please enter an IP address: " ip_address
        if [ -z "$ip_address" ]
        then
            echo "Usage: $0 <IP>"
            exit 1
        fi
else
    ip_address="$1"
fi

printf "\n----- NMAP -----\n\n" > results

echo "Running Nmap..."

nmap $ip_address | tail -n +5 | head -n -3 >> results

while read line
do
        if [[ $line == *open* ]] && [[ $line == *http* ]]
        then
                echo "Running Gobuster..."
                gobuster dir -u $ip_address -w /usr/share/wordlists/dirb/common.txt -qz > temp1

        echo "Running WhatWeb..."
        whatweb $ip_address -v > temp2
        fi
done >> results

if [ -e temp1 ]
then
        printf "\n----- DIRS -----\n\n" >> results
        cat temp1 >> results
        rm temp1
fi

if [ -e temp2 ]
then
    printf "\n----- WEB -----\n\n" >> results
        cat temp2 >> results
        rm temp2
fi

cat results

