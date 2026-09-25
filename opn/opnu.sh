#!/bin/bash
# fname: opnu.sh
# ---

myPOT=$1


if [ $# -ne 1 ]; then
	clear
	printf "USAGE: $0 <absolute path>\n\n"
fi

cd "$(cygpath -u "${myPOT}")"

