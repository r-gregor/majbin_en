#! /usr/bin/env bash
# fname: ff.sh
# descpt: run firefox
# 20260929 v1
# last: 20260929
# ---

FF="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"

PTH=file://$(cygpath -w $PWD | sed 's:\\:/:g')

if [ $# -eq 1 ]; then
    FJL="$1"
    cygstart "${FF}" "${PTH}/${FJL}"
elif  [ $# -eq 0 ]; then
    cygstart "${FF}"
else
    printf "[E] To many parameters!\n"
    exit
fi

