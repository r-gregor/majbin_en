#! /usr/bin/env bash

if [ $# -ne 1 ]; then
    echo -e "Usage: $0 [KOPILAB sent mail subject line]\n"
    exit 1
fi


NM=$1

NM2=$(echo $NM | sed -e 's/č/c/g' -e 's/: /_/g' -e 's/ /_/' -e 's/^/KOPILAB_/' -e 's/ /-/g')
echo $NM2
echo -n $NM2 | putclip
