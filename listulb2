#! /bin/bash

### change: 20150310


clear
echo "List of \"soft-linked\" scripts on ${HOME}/.local/bin:"
echo

for aaa in $(find ${HOME}/.local/bin -type l)
	#do basename "${aaa}"
	do ls -lgG "${aaa}" | awk '{printf "%s;%s\n", $7, $9}'
done
echo

