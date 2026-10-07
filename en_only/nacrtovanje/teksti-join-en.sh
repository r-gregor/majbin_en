#! /usr/bin/env bash
# fname: teksti-join-en.sh
# descpt: pdfjoin tekste into _TEKSTI
pdf
# 20261001 v1
# last: 20261001
# ---

if [ $# -eq 1 ]; then
	OUTPUT="$1"
else
	OUTPUT="_TEKSTI.pdf"
fi

if [ -f "${OUTPUT}" ]; then
	printf "[E] ${OUTPUT} already exists. Supply another filename as argumet\n"
	exit 1
fi

FJLS=$(ls -1 0*.pdf)
java -jar $(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/pdftk-all.jar") $(echo "${FJLS}" |tr '\n' ' ') cat output "${OUTPUT}"

