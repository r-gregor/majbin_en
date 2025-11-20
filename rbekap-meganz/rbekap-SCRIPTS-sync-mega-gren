#! /usr/bin/env bash
# 20251111 (en)
# last change 20251111

SRC="/home/gregor.redelonghi/majstaf/majscripts_en"
DST="mega_gren:ENERGETIKA/majscripts_en"
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

