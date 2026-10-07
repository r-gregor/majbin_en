#! /usr/bin/env bash
# fname: rbekap-DOWNLOADS-copy-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261006
# last: 20261006
# ---

# === GLOBALS ===
SRC="/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ"
DST="mega_gren:ENERGETIKA/Downloads"

# === MAIN ===
if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	printf "[i] backup/copy '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	yes | rclone copy --update "$(cygpath -w "${SRC}")" "${DST}" --progress
else 
	printf "[i] backup/copy '%s' to 'MEGA.nz (mega_gren)'\n" "${SRC}"
	read -r -p "[?] confirm? "
	rclone copy --update "$(cygpath -w "${SRC}")" "${DST}" --progress
fi

printf "\n"

