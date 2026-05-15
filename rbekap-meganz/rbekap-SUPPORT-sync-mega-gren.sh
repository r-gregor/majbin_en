#! /usr/bin/env bash
# fname: rbekap-SUPPORT-sync-mega-gren.sh
# v1_20251111
# last: 20251111
# ---

SRC="/home/gregor.redelonghi/majstaf/majsupport_en"
DST="mega_gren:ENERGETIKA/majsupport_en"
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

