#! /usr/bin/env bash
# filename: rbekap-DAILY-mega-gren.sh
# v1_20251126
# v2_20251127 += inal info
# v3_20251218 += CURRYR
# last: 20251218
# ---

#v3
CURRYR=2026

#v2/v3
declare -a DESTS=("/c/Users/gregor.redelonghi/${CURRYR}/_${CURRYR}_1_PROJEKTI" \
                  "~/majstaf/engit" \
                  "~/majstaf/majscripts_en" \
                  "~/majstaf/majsupport_en" \
                  "~/majstaf/majbookmarks/bookmarks-en" \
                  "~/majstaf/seznami" \
                  "/c/Users/gregor.redelonghi/Downloads/__ARHIVIRAJ")

#v1/v3
echo "[INFO] running DAILY backup/sync to 'MEGA.nz (mega_gren)'"
rbekap-PROJEKTI-sync-mega-gren -y; echo "---" && \
rbekap-ENGIT-sync-mega-gren -y; echo "---" && \
rbekap-SCRIPTS-sync-mega-gren -y; echo "---" && \
rbekap-SUPPORT-sync-mega-gren -y; echo "---" && \
rbekap-BOOKMARKS-EN-sync-mega-gren -y; echo "---" && \
rbekap-SEZNAMI-sync-mega-gren.sh -y; echo "---" && \
rbekap-DOWNLOADS-copy-mega-gren -y

#v2
echo -e "---\n[INFO] backup/sync of:"
for DEST in "${DESTS[@]}"; do
	echo -e "\t'${DEST}'"
done
echo "to 'mega_gren:ENERGETIKA' done"
echo ""

