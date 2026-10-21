#! /usr/bin/env bash
# fname: mrenamef-b.sh
# descpt: rename filename replacing part of filename with pattern
# 20261021
# last: 20261021
# ---


# === MAIN ===
if [ $# -ne 3 ]; then
	printf "[e] usage: mrenamef-b.sh [pattern] [replacement] <fname>\n\n"
	exit 1
fi

# set IFS to '\n'
IFS=$'\n'

pattern="$1"
replacement="$2"
fname="$3"

mv -v "${fname}" "${fname//"${pattern}"/"${replacement}"}"

# set IFS to orginal ' \t\n'
IFS=$' \t\n'

printf "\n"
