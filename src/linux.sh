#!/bin/bash
# SAVEIFS=$IFS
# IFS=$(echo -en "\n\b")
# set me
DIR="DIR"
SRC="/SRCPATH/${DIR}"
DEST="/DESTPATH"
DESTD="${DEST}/${DIR}"

rsync -av -f"+ */" --exclude={'*.srt','*.mp4'} "$SRC" "$DEST"
cd "$DESTD"
for f in */
do
  if [ -d "$f" ]; then
    mkdir -p "./${f}img"
  fi
done
# find $SRC -maxdepth 1 -mindepth 1 -type d | while read dir; do
#   echo "$dir"
# done
# restore $IFS
# IFS=$SAVEIFS