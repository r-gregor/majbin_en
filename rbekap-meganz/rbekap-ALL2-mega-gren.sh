#! /usr/bin/env bash
# filename: rbekap-ALL2-mega-gren.sh
# v1_20250622 from rbekap-DAILY-mega-gren.sh
# last: 202622
# ---

#v3
CURRYR=2026

#v2/v3
declare -a DESTS=("/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI" \
                  "~/majstaf/engit" \
                  "~/majstaf/majscripts_en" \
                  "~/majstaf/majsupport_en" \
                  "~/majstaf/bookmarks-en" \
                  "~/majstaf/seznami" \
                  "~/majstaf/majtoolbox" \
                  "/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ" \
                  "/c/Users/gregor.redelonghi/${CURRYR}/Tehnicne-zahteve_2026/Tehnicne-zahteve_2026-04" \
                  "/h/${CURRYR}/_${CURRYR}_podloge")

#v1/v3
echo "[INFO] running ALL backup/sync to 'MEGA.nz (mega_gren)'"
rbekap-BOOKMARKS-EN-sync-mega-gren -y; echo "---" && \
rbekap-DOWNLOADS-copy-mega-gren -y; echo "---" && \
rbekap-ENGIT-sync-mega-gren -y; echo "---" && \
rbekap-H-PODLOGE-sync-mega-gren -y; echo "---" && \
rbekap-PROJEKTI-sync-mega-gren -y; echo "---" && \
rbekap-SCRIPTS-sync-mega-gren -y; echo "---" && \
rbekap-SUPPORT-sync-mega-gren -y; echo "---" && \
rbekap-TOOLBOX-sync-mega-gren -y; echo "---" && \
rbekap-TZ-2026-sync-mega-gren -y; echo "---" && \
rbekap-SEZNAMI-sync-mega-gren -y; echo "---" && \

#v2
echo -e "---\n[INFO] backup/sync of:"
for DEST in "${DESTS[@]}"; do
	echo -e "\t'${DEST}'"
done
echo "to 'mega_gren:ENERGETIKA' done"
echo ""

