#! /usr/bin/env bash
# fname: qckstrt.sh
# descpt: quick start (cygwin) --> qtm
# 20261001 v1
# last: 20261001
# ---

# if [ "$CURRENT_YEAR_ENV" -ne $(date +%Y) ]; then
# 	CURRYR="$CURRENT_YEAR_ENV"
# else
# 	CURRYR=$(date +%Y)
# fi

OFPOT='/c/Program Files/Microsoft Office/root/Office16'

printf "[i] starting OneCommander (explorer) ...\n"
cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin D2

printf "[i] starting MS OutLook ...\n"
cygstart "${OFPOT}/OUTLOOK.EXE"

printf "[i] starting Super Launcher ...\n"
cygstart "$(cygpath -w "/c/Users/Public/below average/Super Launcher/SuperLauncher.exe")"

printf "[i] all startup instances started successfuly.\n\n"
exit 0

