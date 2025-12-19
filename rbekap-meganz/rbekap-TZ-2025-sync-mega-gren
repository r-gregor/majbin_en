#! /usr/bin/env bash
# 20251021 en
# 20251218 en: += CURRYR
# last change 20251218

CURRYR=2026

SRC="/c/Users/gregor.redelonghi/${CURRYR}/Tehnicne-zahteve_2025/Tehnicne-zahteve_2025-11"
DST="mega_gren:ENERGETIKA/Tehnicne-zahteve_2025/Tehnicne-zahteve_2025-11"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi

