#! /usr/bin/env bash

gr_FF="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"

if [ $# -eq 1 ]; then
	gr_FJL=file://$(cygpath -w $1 | sed 's:\\:/:g')
	cygstart ${gr_FF} ${gr_FJL}
else
	cygstart ${gr_FF}
fi

