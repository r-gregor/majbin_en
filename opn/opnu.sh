#! /usr/bin/env bash
# fname: opn/opnu.sh
# descpt: cd into unix path
# 20261001 v1
# last: 20261001
# ---

unset myPOT

if [ $# -ne 1 ]; then
	clear
	printf "usage: $0 <absolute path>\n\n"
else
	myPOT="$1"
fi

cd "$(cygpath -u "${myPOT}")"

