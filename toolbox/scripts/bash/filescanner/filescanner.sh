#!/bin/bash

# Prompt user for directory to scan
read -p "Enter directory to scan: " directory

# Check if entered directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory not found."
  exit 1
fi

# Create output file
output_file="results/filescanner/scan_results.txt"
touch "$output_file"

# Perform scan and write results to output file
echo "Scanning directory: $directory"
echo "Results saved to: $output_file"
echo "" > "$output_file"
ls -R "$directory" >> "$output_file"

