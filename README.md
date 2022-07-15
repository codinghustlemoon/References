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
   git mv "$f" "$d$e"
  ' find-sh {} \;

```

git mv default.md origin md // this one is due to the above not renaming the current folder
git add /*
git commit -m "renaming files"
git push -u origin main


IN DATABASE
git pull // to update