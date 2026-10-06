#! /usr/bin/env bash
# fname: win10-wallpapers-downloads.sh
# descpt: download win-10 wallpapers from 'Microsoft.Windows.ContentDeliveryManager'
# 20261006 v1
# last: 20261006
# ---

# === GLOBALS ===
danes="win10wallpapers_$(date +%Y%m%d)"
source="/c/Users/gregor.redelonghi/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets"
dest="/c/Users/gregor.redelonghi/majstaf_en/en_staf/WIN10wallpapers/${danes}"

# === FUNCTIONS ===
function testcmd() {
	if [ $? -eq 0 ]; then
		printf "[i] OK\n"
	else
		printf "[E] something went wrong\n\n"
		exit 1
	fi
}

# === MAIN ===
if [ -d ${dest} ]; then
	printf "[E] no such directory: '%s'\n\n" "${dest}"
	exit 1
else
	/usr/bin/mkdir "${dest}"
fi

printf "[i] copying WIN10 wallpapers to '%s'\n" "${dest}"
/usr/bin/cp ${source}/* ${dest}/
testcmd

printf "[i] renaming walpapers to *.jpg files ... \n"
cd "${dest}"
for FFF in $(\ls -1 "${dest}"/*); do
	/usr/bin/mv "${FFF}" "${FFF}.jpg"
done
testcmd

cygstart "explorer" "$(cygpath -w "${dest}")"

printf "[i] done\n\n"

