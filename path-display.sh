#! /usr/bin/env bash
# fname: path-display.sh
# descpt: displays full WINDOWS path of file as parameter
# 20261001 v1
# last: 20261001
# ---

unset fjlnm
hmsg="usage: path-display <filename>"

if [ $# -ne 1 ]; then
    printf "[E] ${hmsg}\n\n"
    exit 1
else
	fjlnm="$1"
fi

if [ -e "${fjlnm}" ]; then
    fullp="$(cygpath -w "$(realpath "${fjlnm}")")"
    printf "[i] win-path: '%s'\n" "${fullp}"
    printf "[i] storing to clipboard ...\n"
    printf "%s" "${fullp}" | putclip
else
    printf "[E] no such file found '%s'\n\n" "${fjlnm}"
    exit 1
fi

