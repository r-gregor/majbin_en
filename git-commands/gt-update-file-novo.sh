#! /usr/bin/env bash
# fname: gt-update-file.sh
# descpt: Update file from src-dir to git-repository
# 20260301 v1
# 20260401 v2: added 'OK?' check into update_file_to_git() function
# 20260924 v3: can be run from anywhere for any file
#              checks for SRC and DEST directories/files
# 20260924 v4: unified scripts for linux
#              HST and system info from exported global variable
# 20260930 v5: added update_log() function to log updates into 'gt-update_file_to_git.log'
#              '*.log must exist, or script terminates
# 20261005 v6: multiple files option
# last: 20260924
# ---

if [ $# -lt 1 ]; then
	printf "\tUsage: gt-update-file <src_fname/s>>\n\n"
	exit 1
fi

update_log() {
	SRCF="${1}"

	local ldest
	local ltmpstmp
	local lsrcf

	ltmpstmp="[$(date +"%Y%m%d-%H%M%S")] --"
	ldest="${HOME}/majstaf/majlogs/gt-update-file.log"
	lsrcf=$(realpath "${SRCF}")

	if [ ! -f "${ldest}" ]; then
		printf "[E] no log file: '%s'\n\n" "${ldest}"
		exit 1
	fi

	printf "%s updated file: %s\n" "${ltmpstmp}" "$(realpath "${SRCF}")" >> "${ldest}"
}

run_update_file() {
	local src_f
	local dst_f

	src_f="${1}"
	dst_f="${2}"

	printf -- "%s\n%s\n%s\n" \
		"[i] from: ${src_f}" \
		"[i] to:   ${dst_f}" \
		"---"
	read -r -p "[?] OK?"
	cp -iv "${src_f}" "${dst_f}"

	update_log "${src_f}"
	printf "\n"
}

unset files_to_update
declare -a files_to_update

while [ "$1" ]; do
	files_to_update+=("$1")
	shift
done

if [ "${#files_to_update[@]}" -lt 1 ]; then
	printf "[E] no files selected\n\n"
	exit 1
fi

for FFF in "${files_to_update[@]}"; do
	if [ ! -f "${FFF}" ]; then
		printf "[E] no such file: '%s'\n\n" "${FFF}"
		exit 1
	fi
done

printf "[i] files to be updated:\n"
for fjl1 in "${files_to_update[@]}"; do
	printf "\t%s\n" "${fjl1}"
done
printf -- "---\n"
read -r -p "[?] continue?"

for FFF in "${files_to_update[@]}"; do
	src_fname=$(realpath "${FFF}")

	SRCF="${src_fname}"
	SRCD="${SRCF%/*}"

	dest_fname=$(echo ${src_fname} | sed "s/\(.*majstaf\)\/\([[:alpha:]]\+\)\/\(.*\)/\1\/${HST}git\/\2_${HST}\/\3/")

	DSTF="$(realpath "${dest_fname}")"
	DSTD="${DSTF%/*}"

	if [ ! -d "${DSTD}" ]; then
		printf "[E] no such destination: %s\n\n" "${DSTD}"
		exit 1
	fi

	ptrn="majstaf/${HST}git"

	if [[ ! "${DSTD}" =~ ${ptrn} ]]; then
		printf "[E] file '%s' must be copied over directly\n\n" "${SRCF}"
		exit 1
	fi

	if [ ! -f "${DSTF}" ]; then
		printf "[W] no such file on destination: %s\n" "${DSTF##*/}"
		read -r -p "[?] continue (y/Y)?" ans
		if [ "${ans}"  != "y" && "${ans}"  != "Y" ]; then
			continue
		else
			run_update_file "${SRCF}" "${DSTF}"
		fi
	fi
done


