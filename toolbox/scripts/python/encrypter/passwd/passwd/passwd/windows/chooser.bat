@echo off

echo Choose an option:
echo 1. Encrypt a password
echo 2. Decrypt a password

set /p choice="Enter your choice: "

if "%choice%"=="1" (
    python en.py
) else if "%choice%"=="2" (
    python de.py
) else (
    echo Invalid choice
)


pause