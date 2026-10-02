#! /usr/bin/env bash
# fname: delbak.sh
# descpt: finds all *.bak files in currdir and subdirs
# 20171116 v1
# last: 20171116
# ---

printf "[i] Starting $0 ...\n"
oldifs=$IFS
IFS=$'\n'

tmpf="$HOME/.tmp/delbaklist.txt"
touch "${tmpf}"

> "${tmpf}"

curdir=$(realpath "$PWD")
printf "[i] The curdir: ${curdir}\n"
printf "[?] Proceed (y/n)?  "
read dans1

if [ "$dans1" != y ] && [ "$dans1" != Y ]; then
	printf "[E] answer is NOT \"y\" or \"Y\"\n"
	printf "[i] done\n\n"
	exit 1
fi


for fls in $(find "${curdir}" -name "*.bak"); do
	echo "${fls}" >> "${tmpf}"
done

st=$(cat "${tmpf}" | wc -l)


if [ "${st}" != 0 ]; then
	cat "${tmpf}"
	printf "\n"
	printf "[i] number of files found: ${st}\n"
	
	oldifs=$IFS
	IFS=$'\n'
	
	printf "[?] Delete (y/n)? "
	read ANS
		if [ "$ANS" == y ] || [ "$ANS" == Y ]; then
			printf "[i] deleting found *.bak files ...\n"
			while read -r fls1; do
				rm -v "${fls1}"
			done < "${tmpf}"
			printf "\n"
			printf "[i] done\n\n"
			
		else
			printf "[E] answer is NOT \"y\" or \"Y\"\n"
			read -p "[?] Press any key to continue or ctrl-c to quit!"
			printf "[i] done\n\n"
		fi
	
	IFS="${oldifs}"
else
	printf "[i] number of files found: ${st}\n"
	printf "[i] done\n\n"
fi

IFS=${oldifs}
rm "${tmpf}"

