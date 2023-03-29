#!/bin/bash

# Prompt the user to enter a website URL
read -p "Enter website URL to scan: " url

# Use the whatweb tool to gather information about the website
whatweb "$url" -v

