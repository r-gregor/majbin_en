#! /usr/bin/env bash
# fname: isitinsvm.sh
# descpt: check if part of movie name is in $SVM
# 20260929 v1
# last: 20260929
# ---


PTH='/home/gregor.redelonghi/majstaf/engit/prenos/_DSVM.txt'

if [ $# -ne 1 ]; then
	printf "[E] must supply a part of movie name\n\n"
	exit 1
else
	PTRN="$1"
fi

grep -i "$PTRN" "${PTH}"

if [ $? -ne 0 ]; then
	echo "[i] NOT IN THE _DSVM: ${PTRN}"
fi

printf "\n"

