#! /usr/bin/env bash
# fname: jvfx-run.sh
# descpt: run java executable (without .java ext) wizh javafx module
# 20261001 v1
# last: 20261001
# ---

unset SC_NAME

if [ $# -ne 1 ]; then
	printf "[E] must supply a filename (without .java ext)\n"
	exit 1
else
	SC_NAME="$1"
fi

java --module-path "${PATH_TO_FX}" --add-modules=javafx.controls "${SC_NAME//.class/}"

