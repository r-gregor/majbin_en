# fname: rbekap-TZ-2026-sync-mega-gren.sh
# 20251021 v1
# 20251218 v2 += CURRYR
# 20260813 v2 RENAMES to names without '_en'
# last: 20260813
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

