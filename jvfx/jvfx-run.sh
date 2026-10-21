#! /usr/bin/env bash
# fname: jvfx-run.sh
# descpt: run java executable (without .java ext) wizh javafx module
# 20261001 v1
# last: 20261001
# ---

# === GLOBALS ===
unset SC_NAME

# === MAIN ===
if [ $# -ne 1 ]; then
	printf "[e] must supply a filename (without .java ext)\n\n"
	exit 1
else
	SC_NAME="$1"
fi

java --module-path "${PATH_TO_FX}" --add-modules=javafx.controls "${SC_NAME//.class/}"

printf "\n"

