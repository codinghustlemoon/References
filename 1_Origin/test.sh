#!/bin/bash

find -type d -links -3 -print0 | while read -d '' dir
do
    # check if it contains some files
    if ls -1qA "$dir" | grep -q .
    then
        echo "$dir"
	filename=$(find "$dir" -maxdepth 1 -type d | cut -c 3- | wc -l)
        if [ "$filename" -gt 1 ]; then
	        echo "not green file"
		echo "#Folder/Category" >> "$dir/directsubfolder.txt"
		echo "#Folder/Color/Blue" >> "$dir/directsubfolder.txt"
		echo "#Folder/Subcolor/2" >> "$dir/directsubfolder.txt"
	else
		echo "is a green file"
		echo "#Folder/Reference" >> "$dir/directsubfolder.txt"
		echo "#Folder/Color/Green" >> "$dir/directsubfolder.txt"
		echo "#Folder/Subcolor/1" >> "$dir/directsubfolder.txt"
        fi
    fi
done
