#! /bin/bash

### Name:   path-display.sh
### Author: RgregoR
### Date:   2018-02-20
### Decription:
### Script that displays full WINDOWS path of <current> file: as parameter
### 
### 


gr_hmsg="Usage: $0 <filename>"


if [ $# -lt 1 ]; then
    echo -e "${gr_hmsg}\n"
    exit 1
fi

gr_fjlnm=$1

if [ -e $gr_fjlnm ]; then
    gr_fullp=$(cygpath -w $(realpath ${gr_fjlnm}))
    echo ${gr_fullp}
    echo "Storing to clipboard ..."
    echo ${gr_fullp} | putclip

else
    echo -e "No such file found!\n"
    exit 1
fi


