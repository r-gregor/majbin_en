#! /usr/bin/env bash
# fname: rbekap-CHOOSE-sync-mega-gren.sh
# v1_20260515
# ---

# globals
SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"
FZFCMD_EN="fzf -e -m --reverse"   # cygwin version does not support --width option
CURRYR=2026

declare -A dsts=(["BOOKMARKS-EN"]="rbekap-BOOKMARKS-EN-sync-mega-gren" \
                  ["DOWNLOADS"]="rbekap-DOWNLOADS-copy-mega-gren" \
                  ["ENGIT"]="rbekap-ENGIT-sync-mega-gren" \
                  ["H-PODLOGE"]="rbekap-H-PODLOGE-sync-mega-gren" \
                  ["PROJEKTI"]="rbekap-PROJEKTI-sync-mega-gren" \
                  ["SCRIPTS"]="rbekap-SCRIPTS-sync-mega-gren" \
                  ["SUPPORT"]="rbekap-SUPPORT-sync-mega-gren" \
                  ["TOOLBOX"]="rbekap-TOOLBOX-sync-mega-gren" \
                  ["TZ-2025"]="rbekap-TZ-2025-sync-mega-gren" \
                  ["TZ-2026"]="rbekap-TZ-2026-sync-mega-gren" \
)


get_longest() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR1] must supply array of sentences as parameter"
		exit 1
	fi

	local len=0
	local longest
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

# === MAIN ===
keys=("${!dsts[@]}")
longest_l=$(get_longest keys)
delline=$(for((i = 0; i < ${#longest_l}; i++)); do printf "-"; done)

selections+=( $((for KEY in "${keys[@]}"; do echo "$KEY"; done | sort; echo "${delline}" ; echo "Quit") | ${FZFCMD_EN}) )

if [ "${#selections[@]}" -eq 0 ]; then
	printf "[INFO] nothing selected"
	exit
fi

count=0
printf "[INFO] rclone cyncing sheduled for:\n"
for DEST in "${selections[@]}"; do
	((count++))
	printf "\t${count} - ${DEST}\n"
done
read -p "OK?"

for SELECTION in "${selections[@]}"; do
	if [ "$SELECTION" == "Quit" ]; then
		exit
	fi

	if [ "${SELECTION}" == "${delline}" ]; then
		continue
	fi


	# echo "${dsts["${SELECTION}"]} -y; printf '---\n'"
	eval "${dsts["${SELECTION}"]} -y; echo \"---\""
done



