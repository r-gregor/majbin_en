#! /usr/bin/env bash
# filename: collect-hstl-en.sh
# descpt: collect all '$SZNM/hstl-*' files into 'commands-history-list-' file sort/dedupe/ ...
# 20251120 v1 collect and filter out all history snapshots till today
# 20260605 v2 fname (base, temp, dest) variables
# 20260811 v3 cat command output into array, and read lines to be parsed from array
#             cleand by 'grep -v' from 'excludes-hstl-en.txt'
# 20260811 v4 external commands to process output outside of for loop --> MUTCH FASTER !!!
# last: 20260811
# ---

SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
SEZNAMI_DIR="$HOME/majstaf/seznami"
CURRYR=$(date +"%Y")
unset CMMNDS
declare -a CMMNDS

fname_base="commands-history-list-${HST}-by-$(date +"%Y%m%d")"
dest_fname="${fname_base}.txt"

export LC_ALL=C
printf "[i] collecting hstl files into ${fname_temp} ...\n"
readarray -t CMMNDS < <(cat ${SEZNAMI_DIR}/hstl-${HST}-${CURRYR}* | cut -b 28- | sort | uniq -c)

# v4
printf "[i] cleaning final ${dest_fname} ...\n"
for LINE in "${CMMNDS[@]}"; do
	echo "${LINE}"
done | cut -b 9- | grep -v -f "${SRCDIR}/excludes-hstl-${HST}.txt" > "${SEZNAMI_DIR}/${dest_fname}"

printf "[i] done\n"

