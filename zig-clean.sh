#! /usr/bin/env bash
# fname: zig-clean.sh
# descpt: clean 'zig-out' '.zig-cache' from zig-project directory
# 20261006 v1
# last: 20261006
# ---

# === GLOBALS ===
TARGET=$PWD
OUT="${TARGET}/zig-out"
CCH="${TARGET}/.zig-cache"

# === MAIN ===
if [ ! -d "${OUT}" ]; then
	printf "[E] no '%s' directory\n\n" "${OUT}"
	exit 1
fi

if [ ! -d "${CCH}" ]; then
	printf "[E] no '%s' directory\n\n" "${CCH}"
	exit 1
fi

printf "[i] directories to be removed:\n"
printf "\t'%s'\n" "${OUT}"
printf "\t'%s'\n" "${CCH}"
read -r -p "[?] confitm?"

rm -rv "${OUT}" "${CCH}"

printf "[i] done \n\n"

