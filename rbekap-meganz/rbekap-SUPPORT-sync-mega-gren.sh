#! /usr/bin/env bash
# fname: rbekap-SUPPORT-sync-mega-gren.sh
# 20251111 v1
# 20260813 v2 RENAMES to names without '_en'
# last: 20260813
# ---

SRC="/home/gregor.redelonghi/majstaf/majsupport"
DST="mega_gren:ENERGETIKA/majsupport"
excludes_path="$(cygpath -w $(dirname $(realpath ${BASH_SOURCE[0]}))/excludes)"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "

	# rclone sync --update --filter-from ${excludes_path} $(cygpath -w "${SRC}") ${DST} --progress
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi

