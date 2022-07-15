# Art_Reference

```bash
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
```