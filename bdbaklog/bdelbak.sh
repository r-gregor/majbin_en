#! /usr/bin/env bash
# fname: bdelbak.sh
# descpt: finds all *.bak files in /c/Users/gregor.redelonghi/${CURRYEAR} with no confirmation (for pddr)
# 20171116 v1
# 20261002 v2
# last: 20261002
# ---

fname='*.bak'

if [ $# -eq 1 ]; then
	CURRYEAR="$1"
else
	CURRYEAR=$(date +"%Y")
fi

curdir="/c/Users/gregor.redelonghi/${CURRYEAR}"

printf "[i] find and delete '%s' files in '%s' and sub-directories ...\n" "${fname}" "${curdir}"
oldifs=$IFS
IFS=$'\n'

unset del_fjls_list
declare -a del_fjls_list

for fjl_found in $(find "${curdir}" -name "${fname}"); do
	del_fjls_list+=("${fjl_found}")
done

st="${#del_fjls_list[@]}"

if [ "${st}" -ne 0 ]; then
	printf "[i] number of files found: ${st}\n"
	oldifs=$IFS
	IFS=$'\n'
	printf "[i] deleting found ${fname} files ...\n"
	for fjl_to_delete1 in "${del_fjls_list[@]}"; do
		rm -v "${fjl_to_delete1}"
		# test
		# printf "command: '%s'\n" "rm -v \"${fjl_to_delete1}\""
	done
	printf -- "---\n"
	IFS="${oldifs}"
else
	printf "[i] number of files found: ${st}\n"
	printf -- "---\n"
fi
IFS=${oldifs}

