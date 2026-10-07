#! /usr/bin/env bash
# fname: vexport-dot-vimrc-mappings-into-file-en.sh
# descpt: export mappings from '~/.vimrc' into external file
# 20261006 v1
# last: 20261006
# ---

# === MAIN ===
if [ $# -ne 1 ]; then
	PREFIX="."
else
	PREFIX="${1}"
fi

if [ ! -d "${PREFIX}" ]; then
	printf "[E] no such directory/dest: '%s'\n\n" "${PREFIX}"
	exit 1
fi

TMSTMP=$(date +"%Y%m%d-%H%M%S")
DESTF="${PREFIX}/dot-vimrc-${HST}-mappings-with-explanations-${TMSTMP}.txt"

touch "${DESTF}"
(printf -- "Mappings from .vimrc (%s): %s\n---\n" "${HST}" "${TMSTMP}") >> "${DESTF}"

cat ~/.vimrc | grep -B1 '^[a-z]*map' >> "${DESTF}"
(printf -- "\" ---\n\n") >> "${DESTF}"

printf "[i] ~/.vimrc mappings succesfully exported to: '%s'\n"  "${DESTF}"

printf "\n"

