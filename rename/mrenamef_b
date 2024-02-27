#! /usr/bin/env bash

if [ $# -ne 3 ]; then
	echo -e "\tUsage:\n\t\t$0 [pattern] [replacement] <fname>\n"
	exit 1
fi

# set IFS to newline '\n'
IFS=$'\n'

pattern=$1
replacement=$2
fname=$3

mv -v ${fname} ${fname//"${pattern}"/"${replacement}"}

# set IFS to orginal ' \t\n'
IFS=$' \t\n'

