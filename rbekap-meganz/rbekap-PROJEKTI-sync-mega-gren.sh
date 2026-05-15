#! /usr/bin/env bash
# fname: rbekap-PROJEKTI-sync-mega-gren.sh
# v1_20251021
# v2_20251218 += CURRYR
# last: 20251218
# ---

CURRYR=2026

SRC="/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI"
DST="mega_gren:ENERGETIKA/_${CURRYR}_1_PROJEKTI"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi


