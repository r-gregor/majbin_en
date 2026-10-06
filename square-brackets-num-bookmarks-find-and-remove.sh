#! /usr/bin/env bash
#! /usr/bin/env bash
# fname: square-brackets-num-bookmarks-find-and-remove.sh
# descpt: find '[digits]' in a filename as parameter and remove them
# 20261006 v1
# last: 20261006
# ---

unset fnm

# === MAIN ===
if [ $# -ne 1 ]; then
	printf "[E] must suply a filename\n\n"
	exit 1
else
	fnm=$1
fi

# show ...
sed -n '/\[[[:digit:]]\{2,3\}\]/p' "${fnm}" | grep -E --color "\[.{2,3}\]"

printf "[?] remove? (yes|YES) or anything else to terminate ... \n"
read -r ANS

if [[ $ANS == "yes" || $ANS == "YES" ]]; then
	sed -i 's/\[[[:digit:]]\{2,3\}\]//g' "${fnm}"
	printf "[i] done\n"
else
	printf "[E] terminating ...\n\n"
	exit 1
fi

printf "\n"

