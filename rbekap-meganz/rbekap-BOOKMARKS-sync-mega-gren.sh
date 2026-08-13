# fname: rbekap-BOOKMARKS-sync-mega-gren.sh
# 20251111 v1
# 20260813 v2 RENAMES to names without '_en'
# last: 20260813
# ---

CURRYR=2026

SRC="${HOME}/majstaf/majbookmarks/"
DST="mega_gren:ENERGETIKA/majbookmarks"

if [ $# -eq 1 ] && [ "${1}" == "-y" ]; then
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	yes | rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
else
	echo "[INFO] backup/sync '${SRC}' to 'MEGA.nz (mega_gren)'"
	read -p "[INFO] Confirm? "
	rclone sync --update $(cygpath -w "${SRC}") ${DST} --progress
fi
