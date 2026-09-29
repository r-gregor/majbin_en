#!/bin/bash

#! /usr/bin/env bash
# fname: /home/gregor.redelonghi/majstaf/majbin/dellog.sh
# descpt: finds all [plot.log] files in currdir and subdirs
# 20171116 v1
# last: 20171116
# ---

# timestamp
function tms() {
	printf "[ $(date +%Y%m%d_%H%M%S) ] "
}

clear
tms; echo "[i] Starting $0 ..."

gr_oldifs=$IFS
IFS=$'\n'

gr_tmpf="$HOME/.tmp/delloglist.txt"
touch "${gr_tmpf}"

> "${gr_tmpf}"

gr_curdir=$(realpath "$PWD")
tms; printf "[i] The curdir: $gr_curdir\n"

# Ask for confirmation:
tms; printf "[?] Proceed [y/n]?  "

# Read ansver:
read dans1

if [ "$dans1" != y ] && [ "$dans1" != Y ]; then
	tms; printf "[E] Your answer is NOT \"y\" or \"Y\"\n"
	tms; printf "DONE!\n"
	exit 1
fi


for fls in $(find "${gr_curdir}" -name "plot.log"); do
	echo "${fls}" >> "${gr_tmpf}"
done

gr_st=$(cat "${gr_tmpf}" | wc -l)


if [ "${gr_st}" != 0 ]; then
	cat "${gr_tmpf}"
	echo
	printf "[i] Number of files found: ${gr_st}\n"

	# setting linefeed as a field sepparator
	gr_oldifs=$IFS
	IFS=$'\n'

	tms; printf "[?] Delete? [y|n] "
	read _ans
		if [ "$_ans" == y ] || [ "$_ans" == Y ]; then
			tms; printf "[i] Deleting found *.bak files ...\n"

			while read fls1; do
				rm -v "${fls1}"
			done < "${gr_tmpf}"
			echo
			tms; printf "[i] done\n"

		else
			tms; printf "[E] Your answer is NOT \"y\" or \"Y\"\n"
			tms; read -p "[?] Press any key to continue or ctrl-c to quit!"
			tms; printf "[i] done\n"
		fi

	# setting field sepparator to its original value
	IFS=${gr_oldifs}
else
	tms; echo "[i] Number of files found: ${gr_st}"
	tms; printf "[i] done\n"
fi

IFS=${gr_oldifs}
rm "${gr_tmpf}"

