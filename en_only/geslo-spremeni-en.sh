#! /usr/bin/env bash
# fname: geslo-spremeni-en.sh
# descpt: change psswd-num in config files for sending mail cli
# 20230523: conf data in ~/.SCRTS file
# last: 20230523
# ---

# === globals ===
gScrts="$HOME/.SCRTS_en"
gTempd="$HOME/.tmp"

if [[ ! -d "$gTempd" ]]; then
	printf "[E] no such directory '%s'\n" "${gTempd}"
	exit 1
fi

# timestamp
function gTms() {
    printf "[ $(date +%Y%m%d_%H%M%S) ] "
}

gTms; printf "[i] starting $0"

# creating backup files
gTms; printf "[i] creating backupfiles ... "

cp "${gScrts}" "${gTempd}/${gScrts}.bckp" 2> /dev/null

printf "[i] done\n"

gTms; printf "[i] checking for 'number' in password ...\n"

getNum() {
	num=$(grep 'PSSWD_SCRTS' "${gScrts}" | grep -oE "[[:digit:]]{3}")
	echo "$num"
}

gOldn=$(getNum "conf")
NUM_O=$(getNum "py")
printf "[i] old passwd number: %s\n\n" "$NUM_O"

gTms; read -r -p "[?] enter NEW passwd num: " gNewn

gTms; printf "[i] old passwd num is: '%s'\n" "${gOldn}"
gTms; printf "[i] NEW passwd num is: '%s'\n" "${gNewn}"

if [ -f "${gScrts}" ]; then
    gTms; printf "[W] files exist. OK to continue ...\n"
else
    gTms; printf "[E] NO config files\n"
    exit 1
fi

gTms; read -r -p "[?] continue?"

# ACTION
gTms; printf "[i] teplacing old psswd in send_config_en.*: \n"
sed -i "s/${gOldn}/${gNewn}/g" "${gScrts}"
grep "${gNewn}" "${gScrts}"

