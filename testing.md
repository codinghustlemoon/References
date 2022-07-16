find . -path '*/*/*' -type f -print -exec sh -c '
echo ${PWD##*/}*
  ' find-sh {} \;


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