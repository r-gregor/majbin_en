#! /usr/bin/env bash
# fname: nacrtovanje/risbe-join-en.sh
# descpt: pdfjoin risbe into _RISBE.pdf
# 20261001 v1
# last: 20261001
# ---

if [ $# -eq 1 ]; then
	OUTPUT="$1"
else
	OUTPUT="_RISBE.pdf"
fi

if [ -f "${OUTPUT}" ]; then
	printf "[E] ${OUTPUT} already exists. Supply another filename as argumet\n"
	exit
fi

FJLS=$(ls -1 0*.pdf)

