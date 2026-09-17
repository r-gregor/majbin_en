#! /usr/bin/env bash
# filename: ff-personal-launch-en
# from ff-launch-en
# 20260508 v7
# 20260917 v8: put FZFCMD into function
# last: 20260917
#---

clear
unset URLS
unset KEYS

# globals
FFCMD_EN=/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe
SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
FNAME="personal_links_list_en" # v7
FPTH="${SRCDIR}"/"${FNAME}"    # v7

# assoc array
declare -A URLS

FZFCMD_EN() {
	fzf -e --reverse # cygwin version does not support --width option
}

# v7
load_links_into_array() {
	while IFS=';' read -r key value; do
		URLS["${key}"]="${value}"
	done < "${FPTH}"
}

# functions
get_longest() {
	local len
	local longest

	if [ ! $# -eq 1 ]; then
		echo "[ERROR1] must supply array of sentences as parameter"
		exit 1
	fi

	len=0
	local -n lines2=$1 # new way: must call array as < array_name >

	for line in "${lines2[@]}"; do
		llen="${#line}"
		if [ "${llen}" -gt "${len}" ]; then
			len="${llen}"
			longest="${line}"
		else
			continue
		fi
	done

	echo "${longest}"
}

ff_personallaunch() {
	local selection
	selection=$( (for KEY in "${KEYS[@]}"; do echo "$KEY"; done | sort; echo "${delline}" ; echo "Quit") | FZFCMD_EN )

	if [ "${selection}" == "" ]; then
		# echo -e "[INFO] nothing selected\n"
		exit 0
	fi

	if [ "${selection}" == "Quit" ]; then
		# echo -e "[INFO] leaving\n"
		exit 0
	fi

	if [ "${selection}" != "${delline}" ]; then
		echo "[INFO] selected: ${selection}"
		nohup ${FFCMD_EN} "${URLS["${selection}"]}" >&/dev/null &
	fi
}

# MAIN
load_links_into_array # v7

# array of keys from URLS
KEYS=("${!URLS[@]}")

longest_l=$(get_longest KEYS)
delline=$(for((i = 0; i < ${#longest_l}; i++)); do printf "-"; done)

while true; do
	ff_personallaunch
done

