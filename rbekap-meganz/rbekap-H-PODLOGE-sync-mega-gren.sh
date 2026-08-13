#! /usr/bin/env bash
# fname: rbekap-H-PODLOGE-sync-mega-gren.sh
# 20251021 v1
# 20251218 v1 += CURRYR
# last: 20251218
# ---

CURRYR=2026

SRC="/h/${CURRYR}/_${CURRYR}_podloge"
DST="mega_gren:ENERGETIKA/h_${CURRYR}_podloge"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi
