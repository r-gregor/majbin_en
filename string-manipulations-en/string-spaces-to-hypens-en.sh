#! /usr/bin/env bash
# fname: string-spaces-to-hypens-en.sh
# v1_20260331
# ---

ARG="$@"

if [ "x${ARG}" = "x" ]; then
	printf "[ERROR] -- no string as argument\n"
	exit
else
	STRNG="$ARG"
fi

OUTPUT=$(echo "${STRNG}" | sed 's/ \././' | tr ' ' '-')
echo "${OUTPUT}" | sed 's/"//g'

