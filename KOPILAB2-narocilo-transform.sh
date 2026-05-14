#! /usr/bin/env bash

if [ $# -ne 1 ]; then
    echo -e "NO PARAMETER! --> Naročilo ...\n"
    exit 1
fi

# COMMAND
newname=$(echo $1 | sed -e 's/Naročilo/KOPILAB_Narocilo/' -e 's/: /_/g' -e 's/ /_/')

echo $newname
echo $newname | putclip
