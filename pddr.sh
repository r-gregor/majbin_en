#! /usr/bin/env bash
# fname: pddr.sh
# descpt: remove *.bak and *.log files from locations with *.dwg files and rsync to /h network-dir
# 20261001 v1
# last: 
# ---

if [ $# -eq 1 ]; then
	CURRYEAR="$1"
else
	CURRYEAR=$(date +"%Y")
fi

~/.local/bin/pddbak ${CURRYEAR} && ~/.local/bin/pddlog ${CURRYEAR} && ~/.local/bin/RSYNC-BACKUP-en ${CURRYEAR}



