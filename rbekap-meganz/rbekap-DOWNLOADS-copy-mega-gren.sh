#! /usr/bin/env bash
# fname: rbekap-DOWNLOADS-copy-mega-gren.sh
# v1_20251021
# last: 20251021
# ---

SRC="/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ"
DST="mega_gren:ENERGETIKA/Downloads"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone copy --update $(cygpath -w "${SRC}") ${DST} --progress
else 
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone copy --update $(cygpath -w "${SRC}") ${DST} --progress
fi

