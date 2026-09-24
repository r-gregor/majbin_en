#! /usr/bin/env bash
# fname: gupdate-file-en.sh
# descpt: Update file from src-dir to git-repository
# 20260301 v1
# 20260401 v2: added 'OK?' check into update_file_to_git() function
# 20260924 v3: can be run from anywhere
# last: 20260924
# ---

HST="en"

# TODO: check if DTSF contains engit folder??


if [ $# -ne 1 ]; then
	printf "\tUsage: gupdate-file <fname>\n\n"
	exit 1
else
	fname=$(realpath "$1")
fi

if [ ! -f ${fname} ]; then
	printf "[ERROR] no such file: %s\n\n" "${fname}"
	exit 1
fi

SRCF="${fname}"
DSTF=$(echo ${fname} | sed "s/\(.*majstaf\)\/\([[:alpha:]]\+\)\/\(.*\)/\1\/${HST}git\/\2_${HST}\/\3/")

if [ ! -f "${DSTF}" ]; then
	printf "[ERROR] no such file: %s\n\n" "${fname}"
	exit 1
fi

update_file_to_git() {
	printf "%s\n%s\n%s\n" \
		"from: ${SRCF}" \
		"to:   ${DSTF}" \
		"---"
	read -p "OK?"
	# TEST
	echo cp -iv "${SRCF}" "${DSTF}"
}

# MAIN
update_file_to_git

printf "\n"


# /home/gregor.redelonghi/majstaf/engit/dotfiles_en
# /home/gregor.redelonghi/majstaf/engit/majbin_en
# /home/gregor.redelonghi/majstaf/engit/majrcs_en
# /home/gregor.redelonghi/majstaf/engit/metsys_en
# /home/gregor.redelonghi/majstaf/engit/seznami_en
# /home/gregor.redelonghi/majstaf/engit/vlpprs_en
