#! /usr/bin/env bash
# fname: fname-convert-4-spaces-to-tabs
# descpt: rename fname: 4 spaces to tabs
# 20226031
# last: 20260331
# ---

ARG="$@"

if [ "${ARG}" = "" ]; then
	printf "[E] -- no string as argument\n"
	exit
else
	FNAME="$ARG"
fi

printf "i[i] converting 4 spaces to tabs for file '${FNAME}' ... "
sed -i 's/ \{4\}/\t/g' "${FNAME}"
printf "[i] OK\n"

