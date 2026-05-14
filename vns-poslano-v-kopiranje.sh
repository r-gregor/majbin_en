#! /usr/bin/env bash

curr_yr=$(date +"%Y")

if [ $# -eq 1 ]; then
	dest="$1"
else
	dest="/c/Users/gregor.redelonghi/${curr_yr}/_${curr_yr}_1_PROJEKTI"
fi

cd ${dest}
for DDD in $(find -type d -name "VN*"); do echo $DDD/podatki/* | grep KOPI; done | cut -d '/' -f2

