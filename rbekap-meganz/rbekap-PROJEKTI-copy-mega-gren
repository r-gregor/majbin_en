#! /usr/bin/env bash
# 20251021 en
# 20251218 en: += CURRYR
# last change 20251218

CURRYR=2026

SRC="/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI"
DST="mega_gren:ENERGETIKA/_${CURRYR}_1_PROJEKTI"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone copy --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "

	rclone copy --update $(cygpath -w "${SRC}") ${DST} --progress
fi


