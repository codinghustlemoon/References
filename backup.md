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
