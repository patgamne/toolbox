#!/bin/bash

echo "Welcome to the password encrypter/decrypter program!"
echo "Please choose an option:"
echo "1. Encrypt a password"
echo "2. Decrypt a password"
read choice

if [ $choice -eq 1 ]
then
    python3 "en.py"
elif [ $choice -eq 2 ]
then
    python3 "de.py"
else
    echo "Invalid choice. Please enter 1 or 2."
fi
