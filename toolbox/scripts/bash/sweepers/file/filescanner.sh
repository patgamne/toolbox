#!/bin/bash

# set the directory to scan
dir_to_scan="/usr/share/wordlists/"

# set the output text file
output_file="/home/kali/outputs/fileoutput.txt"

# use the find command to scan the directory for file names and write them to the output file
find "$dir_to_scan" -type f -printf '%f\n' > "$output_file"

# use sort to sort the file names alphabetically
sorted_file_names=$(sort "$output_file")

# use awk to extract the titles from the file names
titles=$(echo "$sorted_file_names" | awk -F'[-.]' '{print $1}')

# use python and the xlsxwriter module to create an Excel file and write the file names and titles to it
python3 - << EOF
import xlsxwriter

# set the output Excel file
output_excel_file = "/home/kali/outputs/fileoutput.xlsx"

# create the Excel file and add a worksheet
workbook = xlsxwriter.Workbook(output_excel_file)
worksheet = workbook.add_worksheet()

# set the column headers
worksheet.write('A1', 'File Name')
worksheet.write('B1', 'Title')

# write the file names and titles to the worksheet
row = 1
for file_name, title in zip("$sorted_file_names".split('\n'), "$titles".split('\n')):
    worksheet.write(row, 0, file_name)
    worksheet.write(row, 1, title)
    row += 1

# close the workbook
workbook.close()
EOF

