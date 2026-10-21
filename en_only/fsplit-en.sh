#! /usr/bin/env bash
# fname: fsplit-en.sh
# descpt: split file into n-parts
# 20261021 v1
# last: 20261021
# ---

# === GLOBALS ===
PARTS=2
ARGS=("$@")
NUMARGS="${#ARGS[*]}"

# === FUNCTIONS ===
usage() {
	printf "[!] usage: fsplit-en <fname> <n>\n"
	printf "                      fname: file name\n"
	printf "                      n:     number of parts to split fname into\n"
	printf "                             if only <filename> supiplied: n = 2\n\n"
}


# === MAIN ===
case "$NUMARGS" in
	1)
		fname="${ARGS[0]}"
	;;

	2)
		fname="${ARGS[0]}"
		PARTS="${ARGS[1]}"
	;;

	*)
		printf "[e] no filename supplied\n"
		usage
		exit 1
	;;
esac

if [ ! -f "$fname" ]; then
	printf "[e] no such file: '%s'\n\n"  "$fname"
	exit 1
fi

printf "[i] command: "
printf "split -n ${PARTS} -d ${fname} ${fname}_part-\n"
read -r -p "[?] continue?"
split -n "${PARTS}" -d "${fname}" "${fname}_part-"

