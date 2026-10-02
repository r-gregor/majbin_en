#! /usr/bin/env bash
# fname: bddr.sh
# descpt: remove *.bak and *.log files from locations with *.dwg files and rsync to /h network-dir
# 20261001 v1
# last: 20261001
# ---

if [ $# -eq 1 ]; then
	CURRYEAR="$1"
else
	CURRYEAR=$(date +"%Y")
fi

~/.local/bin/bdelbak && \
~/.local/bin/bdellog && \
~/.local/bin/RSYNC-BACKUP-en ${CURRYEAR}





