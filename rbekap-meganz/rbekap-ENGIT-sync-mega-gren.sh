#! /usr/bin/env bash
# fname: rbekap-ENGIT-sync-mega-gren.sh
# v1_20251021
# last: 20251021
# ---

SRC="/home/gregor.redelonghi/majstaf/engit"
DST="mega_gren:ENERGETIKA/ENGIT"
excludes_path="$(cygpath -w $(dirname $(realpath ${BASH_SOURCE[0]}))/excludes)"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update --filter-from ${excludes_path} $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/copy '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update --filter-from ${excludes_path} $(cygpath -w "${SRC}") ${DST} --progress
fi

