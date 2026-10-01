#! /usr/bin/env bash
# fname: KOPILAB2-narocilo-transform-en.sh
# descpt: convert message string for message title to KOPILAB
# 20261001 v1
# last: 20261001
# ---

if [ $# -ne 1 ]; then
	printf "[E] bo parameter --> Naročilo ...\n"
	exit 1
fi

newname=$(echo $1 | sed -e 's/Naročilo/KOPILAB_Narocilo/' -e 's/: /_/g' -e 's/ /_/')

echo "${newname}"
echo "${newname}" | putclip

