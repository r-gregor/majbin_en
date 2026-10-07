#! /usr/bin/env bash
# fname: rbekap-PROJEKTI-sync-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261006
# last: 20261006
# ---

# === GLOBALS ===
CURRYR=2026
SRC="/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI"
DST="mega_gren:ENERGETIKA/_${CURRYR}_1_PROJEKTI"

# === MAIN ===
if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	printf "[i] backup/sync '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	yes | rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
else
	printf "[i] backup/sync '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	read -r -p "[?] confirm? "
	rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
fi

printf "\n"

