#!/bin/bash

# Check if the user provided a directory path as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory="$1"

# Check if the specified directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory '$directory' does not exist."
  exit 1
fi

# Use 'find' to search for files in the specified directory and its subdirectories
# Sort the files by size in reverse order and limit the output to the top 20 files
find "$directory" -type f -exec du -h {} + | sort -rh | head -n 20
