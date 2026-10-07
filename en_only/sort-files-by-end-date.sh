#! /usr/bin/env bash
# fname: sort-files-by-end-date.sh
# descpt: sort all files in directory by end-date: 'fname-...-YYYYmmdd.txt'
# 20261006 v1
# last: 20261006
# ---

# === FUNCTIONS ===
function run1() {
		# for FFF in $(ls -1); do echo $(echo "${FFF}" | sed 's/\(.*\)_\([[:digit:]]\{8\}\).txt/\2 /') "${FFF}"; done | sort -nr | less
		for FFF in $(\ls -1); do echo $(echo "${FFF}" | sed 's/\(.*\)_\([[:digit:]]\{8\}\).*/\2 /') "${FFF}"; done | sort -nr | less
}

function run2() {
		gNr=$1
		# for FFF in $(ls -1); do echo $(echo "${FFF}" | sed 's/\(.*\)_\([[:digit:]]\{8\}\).txt/\2 /') "${FFF}"; done | sort -nr | head -n "${gNr}"
		for FFF in $(\ls -1); do echo $(echo "${FFF}" | sed 's/\(.*\)_\([[:digit:]]\{8\}\).*/\2 /') "${FFF}"; done | sort -nr | head -n "${gNr}"
}

# === MAIN ===
if [[ ! $# -eq 1 ]]; then
	run1
else
	run2 "$1"
fi

