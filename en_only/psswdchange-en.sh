#! /usr/bin/env bash
# fname: psswdchange-en.sh
# descpt: change psswd-num in config files for sending mail CLI
# 0230523: conf data in ~/.SCRTS file
# 20261001
# last: 20261001
# ---


# === GLOBALS ===
scrts_pth="$HOME/.SCRTS_en"
tmpf_pth="$HOME/.tmp"

# === FUNCTIONS ===
get_old_psswd_num() {
	num=$(grep 'PSSWD_SCRTS' "${scrts_pth}" | grep -oE "[[:digit:]]{3}")
	echo "${num}"
}

# === MAIN ===
if [[ ! -d "${tmpf_pth}" ]]; then
	printf "[e] no ${tmpf_pth}/ found\n\n"
	exit 1
fi

printf "[i] creating backupfiles ... \n"
cp "${scrts_pth}" "${tmpf_pth}/${scrts_pth}.bckp" 2> /dev/null
printf "[i] done\n"

printf "[i] checking for 'number' in password ...\n"
old_psswd_num=$(get_old_psswd_num)
# NUM_O=$(get_old_psswd_num "py")
printf "[i] old passwd number: ${old_psswd_num}\n"
printf -- "---\n"

read -r -p "[?} enter NEW passwd num: " new_psswd_num
printf "[i] old passwd num is: ${old_psswd_num}\n"
printf "[i] NEW passwd num is: ${new_psswd_num}\n"

if [ -f "${scrts_pth}" ]; then
	printf "[i] config files exist -- ok to continue ...\n"
else
	printf "[e] no config files\n\n"
	exit 1
fi

read -r -p "[?] continue?"


# ACTION
printf "[i] replacing old psswd in send_config_en.*:\n"
sed -i "s/${old_psswd_num}/${new_psswd_num}/g" "${scrts_pth}"
grep "${new_psswd_num}" "${scrts_pth}"

