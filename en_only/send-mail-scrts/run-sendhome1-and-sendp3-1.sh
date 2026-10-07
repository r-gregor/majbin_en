#! /usr/bin/env bash
# fname: run-sendhome1-and-sendp3-1.sh
# descpt: run sendhome1 and sendp3-1-lnk-en scripts
# 20261006 v1
# last: 20261006
# ---

# === GLOBALS ===
gPth="$HOME/majstaf/majbin/send_mail"
sendsc1="${gPth}/sendhome1list"
sendsc2="${gPth}/sendp3-1-lnk-en"

# === MAIN ===
if [ $# -ne 1 ]; then
	printf "[E] usage: run-sendhome1-and-sendp3-1 [ \"URL\" ]\n"
	exit 1
fi

URL="$1"
"${sendsc1}" "${URL}" && "${sendsc2}" "${URL}"

if [ $? -ne 0 ]; then
	printf "[E] something went wrong!\n\n"
	exit 1
fi

