#! /usr/bin/env bash
# fname: opn/opnw.sh
# descpt: cd into windows path (cygwin)
# 20261001 v1
# last: 20261001
# ---

if [ $# -gt 1 ];then
	clear
	printf "usage: $0 <absolute path>\n"
	exit 1
fi

if [ $# -eq 0 ]; then
	cygstart "explorer" $(cygpath -w "$PWD")
	return
fi

myPOT="$1"
cygstart "explorer" $(cygpath -w "${myPOT}")

