#!/bin/bash

PATH="./"
LASTPATH="$PATH"

while [ 1 -eq 1 ]
do
  if [ `/usr/bin/find "$PATH" -maxdepth 1 -type d -name ".git" | /usr/bin/wc -l` = "1" ]
  then
    echo "$PATH"
    exit 0
  else
    LASTPATH="$PATH"
    PATH="$PATH../"

    if [ `/bin/readlink -f "$PATH"` = `/bin/readlink -f "$LASTPATH"` ]
    then
      echo "./"
      exit 1
    fi
  fi
done
