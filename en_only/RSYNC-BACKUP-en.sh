#! /bin/bash
# filename: RSYNC-BACKUP-en.sh
# descpt: rsync backup '/c/Users/gregor.redelonghi/' to '/h/${curryr}-danes'
# 20171208: --progress replaced with --info=misc2,stats1,progress2 
# 20180315: --progress replaced with --info=misc2,stats2
#            += dT2-dT1 calculation of used seconds
# 20251218: check for CURRENT_YEAR_ENV, and supply current year as cmd arg
#           check if sorce dir exists
# 20261002
# last: 20261002
# ---

if [ -z "${CURRENT_YEAR_ENV}" ]; then
	export CURRENT_YEAR_ENV=$(date +"%Y")
fi

if [ $# -eq 1 ]; then
	gCurrYr=$1
else
	gCurrYr=${CURRENT_YEAR_ENV}
fi

gSrc="/c/Users/gregor.redelonghi"
gDest="/h"

# crtn=100
crtn=3

crtc() {
	for ((i=1; i<=$1; i++)); do
		printf "-"
	done
	printf "\n"
}

if [ ! -d ${gSrc}/${gCurrYr} ]; then
	printf "[E] No such directory: ${gSrc}/${gCurrYr}\n\n"
	exit
fi

dT1=$(date +"%s")

printf "[i] syncing ${gSrc}/${gCurrYr}/ to ${gDest}/${gCurrYr}-danes/ ...  \n"
gCmd='rsync -rltDv'
${gCmd} --delete ${gSrc}/${gCurrYr}/ ${gDest}/${gCurrYr}-danes/ | grep -v '^[[:space:]]*$' | while read line; do echo $line | sed "s/.*/[i] rsync: &/"; done

dT2=$(date +"%s")
crtc $crtn
printf "[i] done in $((dT2-dT1)) seconds!\n"
crtc $crtn

