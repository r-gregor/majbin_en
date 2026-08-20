#! /usr/bin/env bash

PTH='/home/gregor.redelonghi/majstaf/engit/prenos/_DSVM.txt'

if [ $# -ne 1 ]; then
	printf "[ERROR] must supply a part of movie name\n\n"
	exit
else
	PTRN="$1"
fi

grep -i "$PTRN" "${PTH}"

if [ $? -ne 0 ]; then
	echo "NOT IN THE _DSVM: ${PTRN}"
fi

printf "\n"

