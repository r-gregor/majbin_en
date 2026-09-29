#! /usr/bin/env bash
# fname: fname-rename-hypens-to-underscores.sh
# descpt: rename file from hypens to underscores

# 20260929 v1
# last: 
# ---


ARG="$@"

if [ "${ARG}" = "" ]; then
	printf "[E] -- no filename as argument\n"
	exit
else
	FNAME="$ARG"
fi

if [ ! -f "${FNAME}" ]; then
	printf "[E] -- no such file\n"
	exit
fi

NEW_FNAME=$(echo "${FNAME}" | sed 's/ \././' | tr '-' '_')
echo "[i] -- renaming ${FNAME} into ${NEW_FNAME} ..."
read -r -p "OK?"

mv -v "${FNAME}" "${NEW_FNAME}"

printf "[i] done\n"

