#! /usr/bin/env bash
# filename: knowledgedb-move-file-to-category.sh
# descpt: move file to a cathegory in $KNOWLEDGEDB
# v1_20260409 multiple files, with checks ...
# last: 20260409
# ---

if [ $# -lt 1 ]; then
	printf "[E] usage: $0 <filename>\n"
	exit 1
fi

# globals
SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
DEST="${HOME}/majstaf/${HST}git/knowledgedb"

declare -a fjls;

while [ "$1" ]; do
	fjls+=("$1")
	shift
done

if [ "${#fjls[@]}" -lt 1 ]; then
	printf "[E] no files selected"
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

printf "[i] move selected files:\n"
for ((j=0; j<"${#fjls[@]}"; j++)); do
	printf "[i] '%s'\n" "${fjls[j]}"
done
printf "[?] to .../%s (y/n)?  " "${CATEGORY}"
read -r ans

if [ "${ans}" == "y" ] || [ "${ans}" == "Y" ]; then
	# mv -iv ./"${fname}" "${DEST}/${CATEGORY}/"
	for ((k=0; k<"${#fjls[@]}"; k++)); do
		mv -iv ./"${fjls[k]}" "${DEST}/${CATEGORY}/"
	done
	printf "\n"
else
	printf "[E] no files moved\n"
	printf "\n"
	exit 1
fi

