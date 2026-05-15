#! /usr/bin/env bash
# fname: fname-rename-underscores-to-hypens-en
# v1_20226031
# ---

ARG="$@"

if [ "x${ARG}" = "x" ]; then
	printf "[ERROR] -- no filename as argument\n"
	exit
else
	FNAME="$ARG"
fi

if [ ! -f "${FNAME}" ]; then
	printf "[ERROR] -- no such file\n"
	exit
fi

NEW_FNAME=$(echo "${FNAME}" | sed 's/ \././' | tr '_' '-')
printf "[INFO] renaming:\n'${FNAME}' ... to\n'${NEW_FNAME}'\n"
read -p "[INPUT] OK?"
printf "[INFO] "
mv -v "${FNAME}" "${NEW_FNAME}"
printf "\n"

