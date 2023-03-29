#!/bin/bash

if [ "$1" == "" ]
then
    read -p "Please enter an IP address: " ip_address
    if [ "$ip_address" == "" ]
    then
        echo "You forgot an IP address"
        echo "Syntax: $0 192.168.1"
        exit 1
    else
        for ip in `seq 1 254`; do
            ping -c 1 $ip_address.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
        done
    fi
else
    for ip in `seq 1 254`; do
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
fi

#for ip in $(cat ip_new.txt); do nmap -sV -O -o nmap-out.txt $ip; done
