#! /usr/bin/env bash
# fname: find-file-by-word.sh
# descpt: find filenames containing the suplied word
# v1_20160418: find file by containing (whole) word like: grep, sed, ubuntu, 2016 ...
# v2_20160819: added test if search pattern suplied as parameter to scritp, else ask for it ...
# v3_20160819: change grep expression from "\b${WRD}\b" to "${WRD}\w*"
#              (it searches fort the part of the word too)
#---

clear
printf "[i] %s: find files containing the word\n" $(basename $0)

if [ $# -eq 1 ]; then
	WRD=$1
else
	printf "[?] enter the search (whole) word: "
	read WRD
fi

# find -iname "*${WRD}*" 2>/dev/null | grep --color "\b${WRD}\b"
find -iname "*${WRD}*" 2>/dev/null | grep --color "\b${WRD}"

if [ $? -eq 0 ]; then
	printf "\n[i] done\n"
else
	printf "[E] something went wrong, or search pattern was not found ...\n"
	exit 1
fi

