#! /usr/bin/env bash
# filename: knowledgedb-copy-file-to-category.sh
# descpt: copy file to a cathegory in $KNOWLEDGEDB
# v1_20251118
# v2_20260409  en: multiple files, with checks ...
# 20261002
# last: 20261002
# ---

if [ $# -lt 1 ]; then
	printf "[E] usage: $0 <filename>\n"
	exit 1
fi

# globals
SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"
DEST="${HOME}/majstaf/${HST}git/knowledgedb"

declare -a fjls;

while [ "$1" ]; do
	fjls+=("$1")
	shift
done

if [ "${#fjls[@]}" -lt 1 ]; then
	printf "[E] no files selected\n"
	exit 1
fi

for ((i=0; i<"${#fjls[@]}"; i++)); do
	if [ ! -f "${fjls[i]}" ]; then
		printf "[E] no such file:'%s'\n" "${fjls[i]}"
		printf "\n"
		exit
	fi
done

CATEGORY=$(ls -1 ${DEST} | fzf -e --reverse)

printf "[i] copy selected files:\n"
for ((j=0; j<"${#fjls[@]}"; j++)); do
	printf "[i] '%s'\n" "${fjls[j]}"
done
printf "[i] to .../%s (y/n)?  " "${CATEGORY}"
read -r ans

if [ "${ans}" == "y" ] || [ "${ans}" == "Y" ]; then
	for ((k=0; k<"${#fjls[@]}"; k++)); do
		cp -iv ./"${fjls[k]}" "${DEST}/${CATEGORY}/"
	done
	printf "\n"
else
	printf "[E] no files copied\n"
	printf "\n"
	exit 1
fi

