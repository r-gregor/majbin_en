#! /usr/bin/env bash
# fname: rbekap-SCRIPTS-sync-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261006
# last: 20261006
# ---

# === GLOBALS ===
SRC="/home/gregor.redelonghi/majstaf/majscripts"
DST="mega_gren:ENERGETIKA/majscripts"
excludes_path="$(cygpath -w "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"/excludes)"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	printf "[i] backup/sync '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	yes | rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
else
	printf "[i] backup/sync '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	read -r -p "[?] confirm? "

	# rclone sync --update --filter-from "${excludes_path}" "$(cygpath -w "${SRC}")" "${DST}" --progress
	rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
fi

printf "\n"

