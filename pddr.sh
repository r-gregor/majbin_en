#! /usr/bin/env bash
	
if [ $# -eq 1 ]; then
	CURRYEAR=$1
else
	CURRYEAR=$(date +%Y)
fi

~/.local/bin/pddbak ${CURRYEAR} && ~/.local/bin/pddlog ${CURRYEAR} && ~/.local/bin/RSYNC-BACKUP-en ${CURRYEAR}


