#! /usr/bin/env bash
# filename: rbekap-ALL2-mega-gren.sh
# descpt: Rclone sellected files/dirs to mega_gren:
# 20261006
# last: 20261006
# ---

# === GLOBALS ===
CURRYR=2026

declare -a DESTS=("/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI" \
                  "~/majstaf/majscripts" \
                  "~/majstaf/majsupport" \
                  "~/majstaf/majbookmarks" \
                  "~/majstaf/majtoolbox" \
                  "/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ" \
                  "/c/Users/gregor.redelonghi/${CURRYR}/Tehnicne-zahteve_2026/Tehnicne-zahteve_2026-04" \
                  "/h/${CURRYR}/_${CURRYR}_podloge")

# === MAIN ===
printf "[i] running ALL backup/sync to 'MEGA.nz (mega_gren)'\n"
rbekap-BOOKMARKS-sync-mega-gren -y; echo "---" && \
rbekap-DOWNLOADS-copy-mega-gren -y; echo "---" && \
rbekap-H-PODLOGE-sync-mega-gren -y; echo "---" && \
rbekap-PROJEKTI-sync-mega-gren -y; echo "---" && \
rbekap-SCRIPTS-sync-mega-gren -y; echo "---" && \
rbekap-SUPPORT-sync-mega-gren -y; echo "---" && \
rbekap-TOOLBOX-sync-mega-gren -y; echo "---" && \
rbekap-TZ-2026-sync-mega-gren -y; echo "---"

printf -- "---\n[i] backup/sync of:\n"
for DEST in "${DESTS[@]}"; do
	printf "\t'%s'\n" "${DEST}"
done
printf "to 'mega_gren:ENERGETIKA' done\n"

printf "\n"

