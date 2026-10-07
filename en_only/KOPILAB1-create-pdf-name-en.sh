#! /usr/bin/env bash
# fname: KOPILAB1-create-pdf-name-en.sh
# descpt: convert message string to pdf name
# 20261001 v1
# last: 20261001
# ---

if [ $# -ne 1 ]; then
    printf "Usage: $0 [KOPILAB sent mail subject line]\n"
    exit 1
fi

NM="$1"

NM2=$(echo "${NM}" | sed -e 's/č/c/g' -e 's/: /_/g' -e 's/ /_/' -e 's/^/KOPILAB_/' -e 's/ /-/g')
printf "${NM2}\n"
printf "${NM2}" | putclip

