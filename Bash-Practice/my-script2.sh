#!/bin/bash
#
"""
Mission:
Write a script that takes exactly one argument, a directory name. If the number of arguments is more or less than one, print a usage message. If the argument is not a directory, print another message. For the given directory, print the biggest file and the file that was most recently modified.
"""&>/dev/null

if [[ $# -ne 1  ]]
then
  echo "Please give only one argument - a directory name."
  exit 1
fi

dir_name=$1

if [[ ! -d $dir_name ]]
then
  echo "The value $1 is not a directory!"
  echo "Please give only one argument - a directory name."
  exit 1
fi

last_modified_file=$(find $dir_name -type f -mtime -1  | head -1)
largest_file=$(find $dir_name -type f -printf "%s\t%p\n" | sort -n | awk '{print $2}' | tail -n1)

echo "The last modified file in $dir_name is: $last_modified_file"
echo "The largest file in $dir_name is: $largest_file"