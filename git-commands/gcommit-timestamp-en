#! /usr/bin/env bash
# filename: gcommit-timestamp-en
# last change: 20240827

HST="en"
cmd="/usr/bin/git commit"

if [ $# -eq 1 ]; then
	if [ $1 == "-a" ]; then
		echo -n  "/usr/bin/git commit -a ... "
		read -p "OK?"
		$cmd -a
		exit
	else
		msg=$1
	fi
else
	msg="update"
fi

tmpstmp=$(date +"%Y%m%d_%H%M")_${HST}
desc="$msg ${tmpstmp}"

echo -n "/usr/bin/git commit -m \"$desc\" ... "
read -p "OK?"
$cmd -m "$desc"

