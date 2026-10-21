#! /usr/bin/env bash
# fname: np.sh
# descpt: starts notepad++ with or without parameter (file to open)
# 20261001 v1
# last: 20261001
# ---
# === GLOBALS ===
NPPPTH='/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/Notepad++'

# === FUNCTIONS ===
usage () {
	printf "[!] usage: np with or without parameter (file to open)\n"
	printf "              a.) np          just starts blank notepad++\n"
	printf "              b.) np <file>   starts notepad++ with a file\n\n"
}

# === MAIN ===
maxarg=1
if [ $# -gt ${maxarg} ]; then
	clear
	printf "[e] too many arguments - only one or zero\n"
	usage
	exit 1
elif [ $# -eq 1 ]; then
	cygstart "${NPPPTH}"/notepad++.exe $(cygpath -w $(readlink -f "$1"))
else
	cygstart "${NPPPTH}"/notepad++.exe
fi

