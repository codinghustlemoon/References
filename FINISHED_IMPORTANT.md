#NonImportant 
below is fore renaming the foldernames!!
https://stackoverflow.com/questions/4111475/how-to-do-a-logical-or-operation-for-integer-comparison-in-shell-scripting
If the file names do not match we choose the file that is not manualnotation.md or directsubfolder.txt to name as our file 
WORKING
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
   
   if [ "$f" = "manualnotation.md" ] || [ "$f" = "directsubfolder.txt" ]; then
       echo "file is manualnotation.md or directsubfolder.txt"
   else
	   filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
       echo "file is $f"
	   git mv "$f" "$filename.md"
   fi
  ' find-sh {} \;
```

manipulating to get path tags
```bash
echo "$(pwd)" | cut -c 46- | sed 's/[1-9]_/#/g' | sed 's|[/]||g'

```
for dealing with the manual.md files

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

   if [ "$f" = "manualnotation.md" ]; then
	   echo "#NonImportant" > "$f"
   else
      echo "not manualnotation note"
   fi
  ' find-sh {} \;
```


https://stackoverflow.com/questions/2099471/add-a-prefix-string-to-beginning-of-each-line
the directsubfolder.txt
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

   if [ "$f" = "directsubfolder.txt" ]; then
       filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
	   
	   childrenlink=$(find . -maxdepth 1 -type d | sed 's/$/]]/' | cut -c 3- | cut -c 3-)
	   echo "$childrenlink" > "$f"
	   sed -i -e 's/^/[[/' "$f"
	   sed -i 1d "$f"
   else
      echo ""
   fi
  ' find-sh {} \;
```
directsubfolder.

the actual folder note!!
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
   
   filename="${d:2}"
   if [ "$f" = "$filename.md" ]; then
       echo "f is $f and d is $d"
       filepath="$(pwd)"
	   filetitle="### $filename"
   
	   echo "$filetitle" > "$f"
	   echo "$filepath" | cut -c 46- | sed 's/[1-9]_/#/g' | cut -c2-
	   echo "#### Links" >> "$f"
   
	   echo "##### Parent Links" >> "$f"
	   parentdirpath="$(dirname "$filepath")"
	   parentdirname="${parentdirpath##*/}"
	   parentlink="[[${parentdirname:2}]]"
	   echo "$parentlink" >> "$f"

	   echo "##### Children Links" >> "$f"
	   cat directsubfolder.txt >> "$f"
	   cat manualnotation.md | tail -n +2 >> "$f"
   else
      echo "not folder file"
   fi
  ' find-sh {} \;
```
f [ "$e" = "$f" ]; then
      e=""
   else
      e=".$e"
   fi
```bash
cat manualnotation.md | tail -n +3 >> Origin.md
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