#! /usr/bin/env bash
# fname: rbekap-BOOKMARKS-sync-mega-gren.sh
# descpt: Rclone sellected files/dirs to 'mega_gren:'
# 20261006
# last: 20261006
# ---

# === GLOBALS ===
CURRYR=2026
SRC="${HOME}/majstaf/majbookmarks/"
DST="mega_gren:ENERGETIKA/majbookmarks"

# === MAIN ===
if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	printf "[i] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'\n"
	yes | rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
else
	printf "[i] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'\n"
	read -r -p "[i] confirm? "
	rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
fi

printf "\n"

