#! /usr/bin/env bash
# fname: fname-hypens-to-underscores
# descpt: rename file from hypens to underscores
# 20226031
# last: 20260331
# ---

ARG="$@"

if [ "${ARG}" = "" ]; then
	printf "[E] -- no filename as argument\n"
	exit
else
	FJLM="$ARG"
fi

OUTPUT=$(echo "${FJLM}" |  tr '[:upper:]' '[:lower:]' | sed -e 's/: */_/g' -e 's/,//g' -e 's/ \././' | tr '-' '_')
echo "${OUTPUT}" | sed 's/"//g'

