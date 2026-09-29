#! /usr/bin/env bash
# fname: delbak.sh
# descpt: finds all *.bak files in currdir and subdirs
# 20171116 v1
# last: 20171116
# ---

# timestamp
function tms() {
	printf "[ $(date +%Y%m%d_%H%M%S) ] "
}

tms; printf "[i] Starting $0 ...\n"
gr_oldifs=$IFS
IFS=$'\n'
 
# creating temp file to store a list of found files
gr_tmpf="$HOME/.tmp/delbaklist.txt"
touch "${gr_tmpf}"

# empty the file
> "${gr_tmpf}"

gr_curdir=$(realpath "$PWD")
tms; printf "[i] The curdir: ${gr_curdir}\n"

# Ask for confirmation:
tms; printf "[?] Proceed [y/n]?  "

# Read ansver:
read dans1

if [ "$dans1" != y ] && [ "$dans1" != Y ]; then
	tms; printf "[E] Your answer is NOT \"y\" or \"Y\"\n"
	tms; printf "[i] done\n"
	exit 1
fi


for fls in $(find "${gr_curdir}" -name "*.bak"); do
	echo "${fls}" >> "${gr_tmpf}"
done

gr_st=$(cat "${gr_tmpf}" | wc -l)


if [ "${gr_st}" != 0 ]; then
	cat "${gr_tmpf}"
	echo
	tms; echo "[i] Number of files found: ${gr_st}"
	
	# setting linefeed as a field sepparator
	gr_oldifs=$IFS
	IFS=$'\n'
	
	tms; printf "[?] Delete? [y|n] "
	read _ans
		if [ "$_ans" == y ] || [ "$_ans" == Y ]; then
			tms; echo "[i] Deleting found *.bak files ..."
			
			while read fls1; do
				rm -v "${fls1}"
			done < "${gr_tmpf}"
			echo
			tms; printf "[i] done\n"
			
		else
			tms; printf "[E] Your answer is NOT \"y\" or \"Y\"\n"
			read -p "$tms Press any key to continue or ctrl-c to quit!"
			tms; printf "[i] done\n"
		fi
	
	# setting field sepparator to its original value
	IFS="${gr_oldifs}"
else
	tms; echo "Number of files found: ${gr_st}"
	tms; echo "[i] done"
fi

IFS=${gr_oldifs}
rm "${gr_tmpf}"

