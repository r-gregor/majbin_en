#! /usr/bin/env bash
# fname: rbekap-TZ-2026-sync-mega-gren.sh
# v1_20251021
# v2_20251218 += CURRYR
# v3_20260422
# last: 2026042
# ---

CURRYR=2026

SRC="/c/Users/gregor.redelonghi/${CURRYR}/Tehnicne-zahteve_2026/Tehnicne-zahteve_2026-04"
DST="mega_gren:ENERGETIKA/Tehnicne-zahteve_2026/Tehnicne-zahteve_2026-04"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi

