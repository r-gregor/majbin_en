#! /usr/bin/env bash

### Name:	vmf.sh (vimfind)
# -e flag for exact match

if [ $# -eq 1 ]; then
	PTH=$1
	cd $PTH
fi

# adding -r to xargs: if no selection don't run the command!
find . | fzf -e | xargs -r -o vim

