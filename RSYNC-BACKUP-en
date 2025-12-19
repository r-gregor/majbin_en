#! /bin/bash

# filename: RSYNC-BACKUP-en
# 20171208 en: --progress replaced with --info=misc2,stats1,progress2 
# 20180315 en: --progress replaced with --info=misc2,stats2
#              += dT2-dT1 calculation of used seconds
# 20251218 en: check for CURRENT_YEAR_ENV, and supply current year as cmd arg
#              check if sorce dir exists
# last: 20251218

if [ -z "${CURRENT_YEAR_ENV}" ]; then
	export CURRENT_YEAR_ENV=$(date +"%Y")
fi

if [ $# -eq 1 ]; then
	gCurrYr=$1
else
	gCurrYr=${CURRENT_YEAR_ENV}
fi

# test
# echo "current year: $gCurrYr"
# read -p "continue?"

gSrc="/c/Users/gregor.redelonghi"
gDest="/h"

function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# crtn=100
crtn=3

crtc() {
    for ((i=1; i<=$1; i++)); do
        echo -n "-"
    done
    echo
}

if [ ! -d ${gSrc}/${gCurrYr} ]; then
	echo -e "No such directory: ${gSrc}/${gCurrYr}\n"
	exit
fi

dT1=$(date +"%s")

# STARO:
# gCmd="rsync -ruv --chmod=a+rwx,g+rwx,o+rwx"
# gCmd='rsync -rltDv --progress --modify-window=2'  		# RUN backup options
# gCmd='rsync -rltD --info=misc2,stats2 --modify-window=2'  		# RUN backup options
# UPDATED 20180411: --info=name0,stats2,progress0; gFilt='\grep "files\|total"'

# ZAMENJANO 20201209
# gCmd='rsync -rltD --info=name0,stats2,progress0 --modify-window=2'           # RUN backup ptions
# gFilt='/usr/bin/grep "created\|deleted\|transferred"'
# ${gCmd} --delete /c/Users/gregor.redelonghi/${gCurrYr}/ /h/${gCurrYr}-danes/ | eval ${gFilt} | while read line; do (tms; echo $line) | tee -a ${gBkpLog}; done


(tms; echo "syncing ${gSrc}/${gCurrYr}/ to ${gDest}/${gCurrYr}-danes/ ...  ")
gCmd='rsync -rltDv'
# grep -v '^[[:space:]]*$' -- dont print emty lines or those with only spaces
${gCmd} --delete ${gSrc}/${gCurrYr}/ ${gDest}/${gCurrYr}-danes/ | grep -v '^[[:space:]]*$' | while read line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] rsync: &/"; done

dT2=$(date +"%s")
# tms; crtc $(($crtn-20))
tms; crtc $crtn
tms; echo -e "done in $((dT2-dT1)) seconds!"
crtc $crtn

