#! /usr/bin/env bash
# fname: rbekap-CHOOSE-sync-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261002
# last: 20261002
# ---

# === GLOBALS ===
SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
CURRYR=2026

declare -A dsts=(["BOOKMARKS"]="rbekap-BOOKMARKS-sync-mega-gren" \
                  ["DOWNLOADS"]="rbekap-DOWNLOADS-copy-mega-gren" \
                  ["H-PODLOGE"]="rbekap-H-PODLOGE-sync-mega-gren" \
                  ["PROJEKTI"]="rbekap-PROJEKTI-sync-mega-gren" \
                  ["SCRIPTS"]="rbekap-SCRIPTS-sync-mega-gren" \
                  ["SUPPORT"]="rbekap-SUPPORT-sync-mega-gren" \
                  ["TOOLBOX"]="rbekap-TOOLBOX-sync-mega-gren" \
                  ["TZ-2025"]="rbekap-TZ-2025-sync-mega-gren" \
                  ["TZ-2026"]="rbekap-TZ-2026-sync-mega-gren" \
)

# === FUNCTIONS ===

clr_scr() {
	# clear the screen:
	printf "\033[H\033[2J"
}

FZFCMD() {
	fzf -e --reverse
}

get_longest() {
	if [ ! $# -eq 1 ]; then
		printf "[E] must supply array of sentences as parameter\n\n"
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
clr_scr

keys=("${!dsts[@]}")
longest_l=$(get_longest keys)
delline=$(for((i = 0; i < "${#longest_l}"; i++)); do printf "-"; done)

selections+=( $((for KEY in "${keys[@]}"; do echo "${KEY}"; done | sort; echo "${delline}" ; echo "Quit") | FZFCMD) )

if [ "${#selections[@]}" -eq 0 ]; then
	printf "[i] nothing selected\n\n"
	exit 0
fi

for SELECTION in "${selections[@]}"; do
	if [ "$SELECTION" == "Quit" ]; then
		printf "[i] nothing selected\n\n"
		exit 0
	fi
done

count=0
printf "[i] rclone cyncing sheduled for:\n"
for DEST in "${selections[@]}"; do
	((count++))
	printf "\t"${count}" - "${DEST}"\n"
done
read -r -p "[?] confirm?"

if [ "${SELECTION}" == "${delline}" ]; then
	continue
fi

for SELECTION in "${selections[@]}"; do
	eval "${dsts["${SELECTION}"]} -y; echo \"---\""
done

printf "\n"

