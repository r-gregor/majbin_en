#! /usr/bin/env bash
# filename: ff-fb-mails-from-mbox-launch-en.sh
# v3_20260721
# ---

# globals
FFCMD_EN=/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe
SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
FZFCMD_EN="fzf -e --reverse" # cygwin version does not support --width option
fb_files_list="${SRCDIR}/data/fb_files_list_from_mbox.txt"

unset fb_files
declare -A fb_files=()

fb_files_list_update() {
	> "${fb_files_list}"
	local fb_url
	local fb_fname
	for FFF in "${SRCDIR}"/messages/*; do
		fb_url=$(grep '^https://www.facebook.com/share' "$FFF")
		fb_url="${fb_url// /}"
		if [ "${fb_url}" == "" ]; then
			continue
		else
			fb_fname="${FFF##*/}"
			fb_fname="${fb_fname//.txt/}"
			printf "%s;%s\n" "${fb_url}" "${fb_fname}" >> "${fb_files_list}"
		fi
	done
}

fb_files_load() {
	local fb_url
	local fb_url
	echo "[INFO] loading messages ..." # CHANGE 20260223 !!!
	while IFS= read -r LINE; do
		fb_fname="${LINE#*;}"
		fb_fname="${LINE#*;}"
		fb_files+=(["${fb_fname}"]="${fb_url}")
	done <"${fb_files_list}"
	fb_files+=(["Quit"]="Quit")
}

if [ $# -eq 1 ]; then
	if [ "$1" == "-u" ] || [ "$1" == "--update" ]; then
		echo "[INFO] updating ${fb_files_list} ..."
		fb_files_list_update
	fi
	fb_files_load
else
	fb_files_load
fi

# selection=$(for EL in "${!fb_files[@]}"; do
#    echo "${EL}"
# done | "${FZFCMD_EN}")
# cygstart "${FFCMD_EN}" "${fb_files["${selection}"]}"

fb_launch_en() {
	# selection=$(for EL in "${!fb_files[@]}"; do echo "${EL}"; done | "${FZFCMD_EN}")
	selection=$(for EL in "${!fb_files[@]}"; do echo "${EL}"; done | sort -nr | "${FZFCMD_EN}")

	if [ "${selection}" == "" ]; then
		echo -e "[INFO] nothing selected\n"
		exit 0
	fi

	if [ "${selection}" == "Quit" ]; then
		exit 0
	fi

	echo "[INFO] selected: ${selection} | ${fb_files[${selection}]}"
	cygstart "${FFCMD_EN}" "${fb_files["${selection}"]}"
}

while true; do
	fb_launch_en
done

