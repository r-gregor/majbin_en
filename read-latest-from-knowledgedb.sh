#! /usr/bin/env bash

DANES=$(date +"%Y%m%d")
ZDAJ=$(date +"%H")
URA=12
SRC=${KNOWLEDGEDB:-/home/gregor.redelonghi/majstaf/engit/knowledgedb}


if [ $# -eq 1 ]; then
	if [ $((${ZDAJ} - $1)) -le 0  ]; then
		echo -e "Out of time range!\n"
		exit
	fi
	URA=$1
fi

echo -e "\nGetting today's entries:"
echo -e "\tin \"${SRC}\""
echo -e "\tafter: ${URA}:00:00 on ${DANES}"
read -p "Continue?"

find ${SRC} -newermt "${DANES} ${URA}:00:00" -type f | grep -v '\.git' | fzf -m --reverse | xargs -ro vim -pM
