#!/bin/bash

myPOT=$1

if [ $# -gt 1 ];then
	clear
	echo "USAGE: $0 <absolute path>"
	echo
		
fi

if [ $# -eq 0 ]; then
	cygstart "explorer" $(cygpath -w $PWD)
	return
fi 

cygstart "explorer" $(cygpath -w "${myPOT}")
