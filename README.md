# Art_Reference

```bash
find . -type d -exec sh -c 'for d; do touch "$d/directsubfolder.txt"; done' _ {} +
find . -type d -exec sh -c 'for d; do touch "$d/manualnotation.md"; done' _ {} +
find . -type d -exec sh -c 'for d; do touch "$d/directsubfolder.txt"; done' _ {} +
```
```bash
find . -type d -exec sh -c 'for d;
	if test -f "directsubfolder.txt"; then
		echo "directsubfolder.txt exists"
	else
		do touch "$d/directsubfolder.txt" 
	fi; done' _ {} +
```

in the DATABASE Setting it up initially
git init
git remote add origin https://github.com/codinghustlemoon/References.git
git branch -M main
git add '\*.md'
// the '' between the the \*.md is required to limit it in someway from what I remember
git commit -m "some message"
git push -u origin main

NOW IN A NEW EMPTY FOLDER WE CREATE A MANAGER FOR DATABASE
git clone https://github.com/codinghustlemoon/References.git
cd References
// now be very carefule never use this in the database!!! it will rename all files all references destroying the database!!
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
   filename=$"d$e"
   filenameformatted="${filename:2}"
   git mv "$f" "$filenameformatted"
  ' find-sh {} \;

```
below is fore renaming the foldernames!!
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
   if [ "$f_formatted" = "$d_formatted.md" ]; then
       filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
   
	   git mv "$f" "$filename.md"
   else
      echo "d_formatted is $d_formatted and f is $f"
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

   if [ "$f" = ".txt" ]; then
       filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
   
	   git mv "$f" "directsubfolder.txt"
   else
      echo "not folder note"
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
   
   if [ "directsubfolder.md" = "$f" ]; then
      echo "hit"
      git mv "$f" "$d.txt"
   else
      echo "not hit"
   fi
  ' find-sh {} \;
```
git mv default.md origin md // this one is due to the above not renaming the current folder
git add /*
git commit -m "renaming files"
git push -u origin main


IN DATABASE
git pull // to update





```bash
filepath="$(cd ../ && PWD)"
echo ${filepath##*/}*

```

```bash
find . -path '*/*/*' -type f -print -exec sh -c '
filepath="$(cd ../ && PWD)"
   echo ${filepath##*/} 
  ' find-sh {} \;

```

delete certain files
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
   rm "directsubfolder.md"
  ' find-sh {} \;
```

DANGEROUS DO IT INSIDE REFERENCE MAP!!!!!!!! not with .git inside!!!

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
   filepath="filepath: $(pwd)"
   filename="$d"
   echo $filepath > "$f"
   echo $filename >> "$f"
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
   childrenlink=$(find . -maxdepth 1 -type d | sed 's/$/]]/' | cut -c 3- | cut -c 3-)
   echo "$childrenlink" >> "$f"
   
   echo "##### Note Links" >> "$f"
   echo "#### Tags" >> "$f"
  ' find-sh {} \;
```
sed -i '3 i New Line with sed' File1
   childrenlinkformat=$(sed -i -e 's/^/prefix/' | "$childrenlink")
   | cut -c 3- | cut -c 3- 
```bash
find . -maxdepth 1 -type d | while read -r d; do sed -e 's/^/[[/'; done | sed 's/$/]]/' | cut -c 3- | cut -c 3- >> 
```
```bash
find . -maxdepth 1 -type d | awk -v q="'" '{print "line " q $0 q}' | sed 's/$/]]/' | cut -c 3- | cut -c 3- >> 

find . -maxdepth 1 -type d | sed -i -e 's/^/[[/' | sed 's/$/]]/' | cut -c 3- | cut -c 3- >> "$f"
```

```bash
parentdirpath="$(dirname "$(pwd)")"
echo "$parentdirpath"
parentdirname="${parentdirpath##*/}"
echo "$parentdirname"

```

  echo $filepath >> "$f"
   echo $filename >> "$f"
   
https://unix.stackexchange.com/questions/93323/list-subdirectories-only-n-level-deep
```bash
find $filepath -maxdepth 1 -mindepth 1 \
    -type d -exec basename {} \;
```

```bash
find $(pwd) -maxdepth 1 -mindepth 1 \
    -type d -exec basename {} \;
```

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

   if [ "$f" = "$d.md" ]; then
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
	   cat directsubfolder.txt >> "$f"
   
	   echo "##### Note Links" >> "$f"
	   echo "#### Tags" >> "$f"
   else
      echo "not folder note"
   fi
  ' find-sh {} \;
```
f [ "$e" = "$f" ]; then
      e=""
   else
      e=".$e"
   fi

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