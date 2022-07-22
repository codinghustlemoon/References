
Combined!!
```bash

```















#NonImportant 
```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1"
   d="${f%/*}"
   cd "$d" || exit 1
   d="${d##*/}"
   f="${f##*/}"
   e="${f##*.}"
   if [ "$e" = "$f" ]; then
      e=""
   else
      e=".$e"
   fi
   
   filepath="$(pwd)"
   filename="${d:2}"
   filetitle="### $filename"
   
   echo "$filetitle" > "$f"
   echo "#### Links" >> "$f"
   
   echo "##### Parent Links" >> "$f"
   parentdirpath="$(dirname "$filepath")"
   parentdirname="${parentdirpath##*/}"
   parentlink="[[${parentdirname:2}]]"
   echo "$parentlink" >> "$f"

   echo "##### Children Links" >> "$f"
   find . -maxdepth 1 -type d | cut -c 3- | cut -c 3- >> "$f"
   
   echo "##### Note Links" >> "$f"

   
   echo "#### Tags" >> "$f"
 
  ' find-sh {} \;
```


checking the number of files in directory
```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1"
   d="${f%/*}"
   cd "$d" || exit 1
   d="${d##*/}"
   f="${f##*/}"

   d_formatted="${d:2}"
   f_formatted="${f:2}"
   
   filenumber="$(ls -p | grep -v / | wc -l)"
   
   if [ $filenumber = "3" ]; then
	   echo "No Problem"
   else
	   echo "filenumber is $filenumber"
	   
	   touch "directsubfolder.txt"
	   
	   touch "manualnotation.md"
	   echo "#NonImportant" > manualnotation.md
	   
	   filename="${d:2}"
	   git mv "$f" "$filename.md"
	   git add .

   fi
  ' find-sh {} \;
```
removing all files that are not 3 in folder
git add .git add .
```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1"
   d="${f%/*}"
   cd "$d" || exit 1
   d="${d##*/}"
   f="${f##*/}"
   e="${f##*.}"
   if [ "$e" = "$f" ]; then
    e=""
   else
   e=".$e"
   fi

   d_formatted="${d:2}"
   f_formatted="${f:2}"
   
   filenumber="$(ls -p | grep -v / | wc -l)"
   
   if [ $filenumber = "3" ]; then
   	   echo "No Problem"
   elif [ $filenumber = "1" ]; then
   	    rm "$f"
        touch temp.txt
        git add temp.txt
    elif [ $filenumber = "4" ]; then
   	    echo "PROBLEM CHECK THIS MANUALLY"
   	    rm "$f"
   else
        rm "$f"    
   fi
  ' find-sh {} \;
```
```bash

find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1"
   d="${f%/*}"
   cd "$d" || exit 1
   d="${d##*/}"
   f="${f##*/}"
   e="${f##*.}"
   if [ "$e" = "$f" ]; then
      e=""
   else
      e=".$e"
   fi

   d_formatted="${d:2}"
   f_formatted="${f:2}"
   
   filenumber="$(ls -p | grep -v / | wc -l)"
   
   if [ $filenumber = "3" ]; then
	   echo "No Problem"
   else
	   echo "filenumber is $filenumber"
	   
	   touch "directsubfolder.txt"
	   filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
	   
	   childrenlink=$(find . -maxdepth 1 -type d | sed 's/$/]]/' | cut -c 3- | cut -c 3-)
	   echo "$childrenlink" > directsubfolder.txt
	   sed -i -e 's/^/[[/' "$f"
	   sed -i 1d "$f"
	   
	   touch "manualnotation.md"
	   echo "#NonImportant" > "manualnotation.md"
	   touch "foldernote"
	   
	   git mv "foldernote" "$filename.md"
   
	   echo "$filetitle" > "$f"
	   echo "#### Links" >> "$f"
   
	   echo "##### Parent Links" >> "$f"
	   parentdirpath="$(dirname "$filepath")"
	   parentdirname="${parentdirpath##*/}"
	   parentlink="[[${parentdirname:2}]]"
	   echo "$parentlink" >> "$f"

	   echo "##### Children Links" >> "$f"
	   cat directsubfolder.txt >> "$f"

	   
   fi
  ' find-sh {} \;