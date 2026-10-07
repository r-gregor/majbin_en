#! /usr/bin/env bash
# fname: rbekap-TOOLBOX-sync-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261002
# last: 20261002
# ---

# === GLOBALS ===
SRC="/home/gregor.redelonghi/majstaf/majtoolbox"
DST="mega_gren:ENERGETIKA/majtoolbox"
# excludes_path="$(cygpath -w "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"/excludes)"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	printf "[i] backup/copy '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	yes | rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
else
	printf "[i] backup/copy '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	read -r -p "[?] confirm? "

	# rclone sync --update --filter-from "${excludes_path}" "$(cygpath -w "${SRC}")" "${DST}" --progress
	rclone sync --update "$(cygpath -w "${SRC}")" "${DST}" --progress
fi

printf "\n"

