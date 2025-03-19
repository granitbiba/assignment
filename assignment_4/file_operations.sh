#!/bin/bash

# Write text to a file
echo "In this task, I created a script that performs basic file operations. The script writes text to a file, copies the content to another file, and filters the content by counting dots, lines, and extracting words starting with "xyz". The output is saved in separate files." > file_operations.txt
echo "Text written to file_operations.txt"

# Copy the file
cp file_operations.txt copy_of_file_operations.txt
echo "Copied file_operations.txt to copy_of_file_operations.txt"

# Count dots
dot_count=$(grep -o "\." file_operations.txt | wc -l)
echo "Number of dots: $dot_count"

# Count lines
line_count=$(wc -l < file_operations.txt)
echo "Number of lines: $line_count"

# Find words starting with "xyz"
grep -o '\bfile[a-zA-Z0-9_]*\b' file_operations.txt > filtered_words.txt
echo "Words starting with 'xyz' saved in filtered_words.txt"

