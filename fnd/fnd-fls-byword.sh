#! /bin/bash
# fname: find-file-by-word.sh
# v1_20160418: find file by containing (whole) word like: grep, sed, ubuntu, 2016 ...
# v2_20160819: added test if search pattern suplied as parameter to scritp, else ask for it ...
# v3_20160819: change grep expression from "\b${gr_WRD}\b" to "${gr_WRD}\w*"
#              (it searches fort the part of the word too)
#---

clear
echo "$(basename $0): FINDING FILES BY CONTAINING WORD"

if [ $# -eq 1 ]; then
	gr_WRD=$1
else
	echo -n "Enter the search (whole) word: "
	read gr_WRD
fi

# find -iname "*${gr_WRD}*" 2>/dev/null | grep --color "\b${gr_WRD}\b"
find -iname "*${gr_WRD}*" 2>/dev/null | grep --color "\b${gr_WRD}"

if [ $? -eq 0 ]; then
	echo -e "\nDone."
else
	echo -e "Something went wrong, or search pattern was not found ...\n"
	exit 1
fi

