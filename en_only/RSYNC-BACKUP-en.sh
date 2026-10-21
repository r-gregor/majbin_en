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

# === GLOBALS ===
src_dir="/c/Users/gregor.redelonghi"
dest_dir="/h"
rsync_cmd='rsync -rltDv'
crtn=3

# === FUNCTIONS ===
crtc() {
	for ((i=1; i<=$1; i++)); do
		printf "-"
	done
	printf "\n"
}

# === MAIN ===
if [ -z "${CURRENT_YEAR_ENV}" ]; then
	export CURRENT_YEAR_ENV=$(date +"%Y")
fi

if [ $# -eq 1 ]; then
	curr_yr=$1
else
	curr_yr=${CURRENT_YEAR_ENV}
fi

if [ ! -d ${src_dir}/${curr_yr} ]; then
	printf "[e] No such directory: ${src_dir}/${curr_yr}\n\n"
	exit
fi

dT1=$(date +"%s")

printf "[i] syncing ${src_dir}/${curr_yr}/ to ${dest_dir}/${curr_yr}-danes/ ...  \n"
${rsync_cmd} --delete ${src_dir}/${curr_yr}/ ${dest_dir}/${curr_yr}-danes/ | grep -v '^[[:space:]]*$' | while read line; do echo $line | sed "s/.*/[i] rsync: &/"; done

dT2=$(date +"%s")
crtc $crtn
printf "[i] done in $((dT2-dT1)) seconds!\n"
crtc $crtn

printf "\n"

