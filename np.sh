#! /usr/bin/env bash
# fname: np.sh
# descpt: starts notepad++ with or without parameter (file to open)
# 20261001 v1
# last: 20261001
# ---

usage () {
cat <<USAGE
+------------------------------------------------------------------------+
| Usage:                                                                 |
| Script that starts notepad++ with or without parameter (file to open): |
| a.) np          just starts blank notepad++                            |
| b.) np <file>   starts notepad++ with a file                           |
+------------------------------------------------------------------------+
USAGE
}

NPPPTH='/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/Notepad++'

maxarg=1
if [ $# -gt ${maxarg} ]; then
	clear
	printf "[E] too many arguments - only one or zero\n"
	usage
	exit 1
elif [ $# -eq 1 ]; then
	cygstart "${NPPPTH}"/notepad++.exe $(cygpath -w $(readlink -f "$1"))
else
	cygstart "${NPPPTH}"/notepad++.exe
fi

