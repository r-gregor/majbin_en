#! /usr/bin/env bash
# fname: isitinsvm.sh
# descpt: check if part of movie name is in $SVM
# 20260929 v1
# 20261013 v2 change PTH --> make it universal
# last: 20261013
# ---


PTH="${HOME}/majstaf/${HST}git/prenos/seivom/"

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

