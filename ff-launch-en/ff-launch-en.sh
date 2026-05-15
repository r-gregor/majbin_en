#! /usr/bin/env bash
# filename: ff-launch-en
# v6_20260305
# last: 20260305
# ---

clear

# globals
FFCMD_EN=/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe
SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"
FZFCMD_EN="fzf -e --reverse" # cygwin version does not support --width option
SITES="${SRCDIR}/sites.txt"

ff_launch() {
	local URLs site selection path

	if [ "$1" == "all" ]; then
		readarray -t URLS < <(cat ${SITES})
	else
		site=$1
		# v4
		# readarray -t URLS < <(sed -n "/\[${site}\]/,/^$/p" ${SITES} | sed -n '2,$'p)
		readarray -t URLS < <(sed -n "/\[${site}\]/,/^$/p" ${SITES})
	fi

	selection=$(for URL in "${URLS[@]}"; do echo "$URL"; done 2>/dev/null | ${FZFCMD_EN})

	if [ "x${selection}" == "x" ]; then
		echo -e "[INFO] nothing selected\n"
		exit
	fi

	if [[ ${selection} =~ ^(---) ]]; then
		echo -e "[INFO] nothing selected\n"
		exit
	fi

	if [[ ${selection} =~ ^\[.*\] ]]; then
		echo -e "[INFO] nothing selected\n"
		exit
	fi

	path=$(echo "${selection}" | cut -d ' ' -f1)
	cygstart ${FFCMD_EN} "${path}"
}

# v5
readarray -t categories < <(sed -n "/\[.*\]/p" "${SITES}" | sed -e 's/\[//' -e 's/\]//')
categories+=("ALL")
categories+=("q (quit)")

while true; do
	selected=$(for WAY in "${categories[@]}"; do echo $WAY; done | fzf +c --reverse)

	if [ "x${selected}" == "x" ]; then
		echo -e "[INFO] nothing selected\n"
		exit
	fi

	if [ "${selected}" == "q (quit)" ]; then
		exit
	fi

	if [ "${selected}" == "ALL" ]; then
		dest="all"
	else
		dest="${selected}"
	fi

	ff_launch "${dest}"
done
