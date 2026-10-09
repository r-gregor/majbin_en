#! /usr/bin/env bash
# filename: rbekap-DAILY-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261002
# last: 20261002
# ---

# === GLOBALS ===
CURRYR=2026

declare -a DESTS=("/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI" \
                  "~/majstaf/majscripts" \
                  "~/majstaf/majsupport" \
                  "~/majstaf/majbookmarks" \
                  "/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ")

# === MAIN ===
printf "[i] running DAILY backup/sync to 'MEGA.nz (mega_gren)'\n"
rbekap-PROJEKTI-sync-mega-gren -y; echo "---" && \
rbekap-SCRIPTS-sync-mega-gren -y; echo "---" && \
rbekap-SUPPORT-sync-mega-gren -y; echo "---" && \
rbekap-BOOKMARKS-sync-mega-gren -y; echo "---" && \
rbekap-DOWNLOADS-copy-mega-gren -y

printf -- "---\n[i] backup/sync of:\n"
for DEST in "${DESTS[@]}"; do
	printf "\t'%s'\n" "${DEST}"
done
printf "to 'mega_gren:ENERGETIKA' done\n"

printf "\n"

