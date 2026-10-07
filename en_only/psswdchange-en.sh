#! /usr/bin/env bash
# fname: psswdchange-en.sh
# descpt: change psswd-num in config files for sending mail CLI
# 0230523: conf data in ~/.SCRTS file
# 20261001
# last: 20261001
# ---

# path to .SCRTS
# gCurdir="$HOME/majstaf/majbin/send_mail_scrts/"
gScrts="$HOME/.SCRTS_en"

# path to temp backup files
gTempd="$HOME/.tmp"

if [[ ! -d "${gTempd}" ]]; then
	printf "[E] error: There is no ${gTempd}/\n\n"
	exit 1
fi

printf "[i] starting $0 ...\n"

# creating backup files
printf "[i] creating backupfiles ... "

# for gEnd in conf py; do
#	  cp ${gCurdir}/send_config_en.${gEnd} ${gTempd}/send_config_en.${gEnd}_${gTms}.bckp 2> /dev/null
# done
cp "${gScrts}" "${gTempd}/${gScrts}.bckp" 2> /dev/null
printf " done\n"

# TEST for PSWD in config files
printf "[i] checking for 'number' in password ...\n"

getNum() {
	num=$(grep 'PSSWD_SCRTS' "${gScrts}" | grep -oE "[[:digit:]]{3}")
	echo "${num}"
}

gOldn=$(getNum "conf")
NUM_O=$(getNum "py")
printf "[i] old passwd number: $NUM_O\n"
printf -- "---\n"

read -r -p "[?} enter NEW passwd num: " gNewn
printf "[i] old passwd num is: ${gOldn}\n"
printf "[i] NEW passwd num is: ${gNewn}\n"

# TEST for files
if [ -f "${gScrts}" ]; then
	gTms; printf "[i] files exist. OK to continue ...\n"
else
	gTms; printf "[E] NO config files\n"
	exit 1
fi

read -r -p "[?] continue?"


# ACTION
printf "[i] replacing old psswd in send_config_en.*:\n"
sed -i "s/${gOldn}/${gNewn}/g" "${gScrts}"
grep "${gNewn}" "${gScrts}"

