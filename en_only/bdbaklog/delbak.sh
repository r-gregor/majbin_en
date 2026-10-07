#! /usr/bin/env bash
# fname: delbak.sh
# descpt: finds all *.bak files in currdir and subdirs
# 20171116 v1
# 20261002 v2
# last: 20261002
# ---

fname='*.bak'

printf "[i] find and delete '%s' files in current directory and sub-directories ...\n" "${fname}"
oldifs=$IFS
IFS=$'\n'

unset del_fjls_list
declare -a del_fjls_list

curdir=$(realpath "$PWD")
printf "[i] curdir: ${curdir}\n"
printf "[?] proceed (y/n)?  "
read dans1

if [ "$dans1" != y ] && [ "$dans1" != Y ]; then
	printf "[E] answer is NOT 'y' or 'Y'\n"
	printf "[i] done\n\n"
	exit 1
fi

for fjl_found in $(find "${curdir}" -name "${fname}"); do
	del_fjls_list+=("${fjl_found}")
done

st="${#del_fjls_list[@]}"

if [ "${st}" -ne 0 ]; then
	for fjl_to_delete in "${del_fjls_list[@]}"; do
		printf "%s\n" "${fjl_to_delete}"
	done
	printf -- "---\n"
	printf "[i] number of files found: ${st}\n"
	
	oldifs=$IFS
	IFS=$'\n'
	
	printf "[?] delete (y/n)? "
	read ANS
		if [ "$ANS" == y ] || [ "$ANS" == Y ]; then
			printf "[i] deleting found ${fname} files ...\n"
			for fjl_to_delete1 in "${del_fjls_list[@]}"; do
				rm -v "${fjl_to_delete1}"
				# test
				# printf "command: '%s'\n" "rm -v \"${fjl_to_delete1}\""
			done
			printf -- "---\n"
			printf "[i] done\n\n"
			
		else
			printf "[E] answer is NOT 'y' or 'Y'\n"
			read -p "[?] press any key to continue or ctrl-c to quit!"
			printf "[i] done\n\n"
		fi
	
	IFS="${oldifs}"
else
	printf "[i] number of files found: ${st}\n"
	printf "[i] done\n\n"
fi
IFS=${oldifs}

