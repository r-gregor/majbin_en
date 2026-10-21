#! /usr/bin/env bash
# fname: geslo-spremeni-en.sh
# descpt: change psswd-num in config files for sending mail cli
# 20230523: conf data in ~/.SCRTS file
## 20261021
# last: 20261021
# ---

printf "\n"

# === GLOBALS ===
scrts_pth="$HOME/.SCRTS_en"
tmpf_pth="$HOME/.tmp"

# === FUNCTIONS ===
get_old_psswd_num() {
	num=$(grep 'PSSWD_SCRTS' "${scrts_pth}" | grep -oE "[[:digit:]]{3}")
	echo "$num"
}

# === MAIN ===
if [[ ! -d "$tmpf_pth" ]]; then
	printf "[e] no such directory '%s'\n" "${tmpf_pth}"
	exit 1
fi

printf "[i] creating backupfiles ... \n"
cp "${scrts_pth}" "${tmpf_pth}/${scrts_pth}.bckp" 2> /dev/null
printf "[i] done\n"

printf "[i] checking for 'number' in password ...\n"


old_psswd_num=$(get_old_psswd_num "conf")
NUM_O=$(get_old_psswd_num "py")
printf "[i] old passwd number: %s\n\n" "$NUM_O"

read -r -p "[?] enter NEW passwd num: " new_psswd_num

printf "[i] old passwd num is: '%s'\n" "${old_psswd_num}"
printf "[i] NEW passwd num is: '%s'\n" "${new_psswd_num}"

if [ -f "${scrts_pth}" ]; then
	printf "[!] files exist. OK to continue ...\n"
else
	printf "[e] no config files\n\n"
	exit 1
fi

read -r -p "[?] continue?"

printf "[i] replacing old psswd in send_config_en.*: \n"
sed -i "s/${old_psswd_num}/${new_psswd_num}/g" "${scrts_pth}"
grep "${new_psswd_num}" "${scrts_pth}"

