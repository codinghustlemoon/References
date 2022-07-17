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
      echo "not folder note"
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
	   echo "#### Links" >> "$f"
   
	   echo "##### Parent Links" >> "$f"
	   parentdirpath="$(dirname "$filepath")"
	   parentdirname="${parentdirpath##*/}"
	   parentlink="[[${parentdirname:2}]]"
	   echo "$parentlink" >> "$f"

	   echo "##### Children Links" >> "$f"
	   cat directsubfolder.txt >> "$f"
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