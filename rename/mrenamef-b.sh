#! /usr/bin/env bash
# fname: mrenamef-b.sh
# descpt: rename filename replacing part of filename with pattern
# 20261001 v1
# last: 
# ---

if [ $# -ne 3 ]; then
	printf "[E] \tUsage:\n\t\t$0 [pattern] [replacement] <fname>\n\n"
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

