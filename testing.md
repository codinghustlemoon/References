
```bash
# find leaf directories
find -type d -links -3 -print0 | while read -d '' dir
do
    # check if it contains some files
    if ls -1qA "$dir" | grep -q .
    then
        echo "$dir"
        filenumber="find "$dir" -maxdepth 1 -type d | cut -c 3- | wc -l"
        if ["$filenumber" -gt 1 ]; then
           echo "there exists a folder $filenumber minus 1 of them"
	   else
	       echo "there is zero folders"
	   fi
    fi
done
```
https://stackoverflow.com/questions/63451128/find-all-directories-that-dont-contain-other-directories
```bash
find -type d -links -3 -print0 | while read -d '' dir
do
    # check if it contains some files
    if ls -1qA "$dir" | grep -q .
    then
        echo "$dir"
        filenumber=$(find "$dir" -maxdepth 1 -type d | cut -c 3- | wc -l)
        echo "$filenumber"
    fi
done
```
```bash
find -type d -links -3 -print0 | while read -d '' dir
do
    # check if it contains some files
    if ls -1qA "$dir" | grep -q .
    then
        echo "$dir"
        if [ $(find "$dir" -maxdepth 1 -type d | cut -c 3- | wc -l) -gt 1 ]; then
	        echo "not green file"
		else
			echo "is a green file"
        fi
    fi
done
```




https://stackoverflow.com/questions/17648033/counting-number-of-directories-in-a-specific-directory
```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1" 
   f="${f##*/}"

   echo "f: $f and path $(pwd)"
   
   if [ "$f" = "directsubfolder.txt" ]; then
	   filepwd=$(readlink -f $f)
       filenumber=$(find $filepwd -maxdepth 1 -type d | cut -c 3- | wc -l)
       if ["$filenumber" -gt 1 ]; then
           echo "there exists a folder $filenumber minus 1 of them"
	   else
	       echo "there is zero folders"
	   fi
   else
	   echo "file is not directsubfolder.txt"
   fi
  ' find-sh {} \; 
```
```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1" 
   f="${f##*/}"
   filepwd="$(find . -name directsubfolder.txt)"
   echo "f: $f and $filepwd path $(find "$filepwd" -maxdepth 1 -type d | cut -c 3- | wc -l)"
  ' find-sh {} \; 
```
```bash
find . -name 'directsubfolder.txt' -exec sh -c '
   f="$1" 
   f="${f##*/}"
	echo "f: $pwd"
' find-sh {} \;
```
```bash







find . -path '*/*/*' -type f -print -exec sh -c '
echo ${PWD##*/}*
  ' find-sh {} \;
#NonImportant 

find . -path '*/*/*' -type d -print -exec sh -c '
echo ${PWD##*/}*
  ' find-sh {} \;

echo $(cd ../ && PWD)
https://unix.stackexchange.com/questions/46244/get-a-list-of-directory-names-with-find
https://stackoverflow.com/questions/8426058/getting-the-parent-of-a-directory-in-bash
https://www.geeksforgeeks.org/sed-command-linux-set-2/?ref=rp
https://www.geeksforgeeks.org/sed-command-linux-set-2/?ref=rp
https://superuser.com/questions/538877/get-the-parent-directory-for-a-file

filepath= echo $(cd ../ && PWD)
parentname="$(basename "$(dirname "$filepath")")"
echo "$parentname"


```bash
filepath="$(cd ../ && PWD)"
echo ${filepath##*/}*

```

```bash
find . -path '*/*/*' -type f -print -exec sh -c '
filepath="$(cd ../ && PWD)"
echo ${filepath##*/}*
  ' find-sh {} \;

```

find . -path '*/*/*' -type f -print -exec sh -c '
filepath="$(cd ../ && PWD)"
echo $filepath
  ' find-sh {} \;

filepath="$(PWD)"
echo ${filepath##*/}*




pwd var=$(pwd) 
basename $(pwd)
mydir="$(basename $PWD)" 
echo "$mydir"
find . -type d -exec sh -c 'for d; do touch "$d/default"; done' _ {} +


find . -type d -exec sh -c 'for d; do
echo "$pwd"
touch "$d/test"; done' _ {} +





```

```bash
find . -type d -exec sh -c 'for d; do touch "$d/default"; done' _ {} +

find . -name 'default' -exec sh -c 'mv "$0" "${0%.$(basename $PWD)}"' {} \;

find . -name 'default' -exec sh -c 'mv "$0" "${"$(basename $PWD)"}"' {} \;

current_dir=${PWD##*/} 
echo "$current_dir"
printf "%s\n" "${PWD##*/}" 
echo "${PWD##*/}"


find . -type d -exec sh -c 'for d; do touch "$d/default"; done' _ {} +

find . -name 'default' -exec sh -c 'mv "$0" "$(basename $PWD)"' {} \;


find . -type d -exec sh -c 'for d; do touch "$d/default"; done' _ {} +
find . -name 'default' -exec sh -c 'mv "$0" "test.txt"' {} \;





```bash
find . -path '*/*/*' -type f -print -exec sh -c '
   f="$1"
   d="${f%/*}"
   cd "$d" || exit 1
   d="${d##*/}"
   f="${f##*/}"
   e="${f##*.}"
   if [ "$e" = "$f"]; then
      e=""
   else
      e=".$e"
   fi
   if [ "default" = "$f"]; then
      mv -i -- "$f" "$d$e"
   else
      echo "AHHHHHH"
   fi
  ' find-sh {} \;
```
```
to recursively change all files to parent file
https://superuser.com/questions/1602705/recursively-renaming-files-under-subdirectories-with-the-directory-name-with-lin




## to add a default file to all folders
find . -type d -exec sh -c 'for d; do touch "$d/default"; done' _ {} +





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
   git mv -i -- "$f" "$d$e"
  ' find-sh {} \;



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
   git mv "$f" "$d$e"
  ' find-sh {} \;
```


https://reactgo.com/bash-remove-first-n-characters/
https://www.geeksforgeeks.org/cut-command-linux-examples/
REMOVEING N CHARACTERS FROM STING
https://www.baeldung.com/linux/bash-remove-first-characters

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
   if [ "$f" = "$" ]; then
       filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
   
	   git mv "$f" "$filename.md"
   if [ "$f_formatted" = "$d_formatted.md" ]; then
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

   d_formatted="${d:2}"
   f_formatted="${f:2}"
   if [ "$f" = "$" ]; then
       filepath="$(pwd)"
	   filename="${d:2}"
	   filetitle="### $filename"
   
	   git mv "$f" "$filename.md"
   if [ "$f_formatted" = "$d_formatted.md" ]; then
   else
      echo "d_formatted is $d_formatted and f is $f"
   fi
  ' find-sh {} \;
```