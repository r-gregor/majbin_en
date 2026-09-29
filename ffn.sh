#! /usr/bin/env bash
# fname: ffn.sh
# descpt: launch Firefox
# 20260929 v1
# last: 
# ---


FF="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"

if [ $# -eq 1 ]; then
	FJL=file://$(cygpath -w $1 | sed 's:\\:/:g')
	cygstart ${FF} ${FJL}
else
	cygstart ${FF}
fi

