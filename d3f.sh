#! /usr/bin/env bash
# fname: d3f.sh
# descot: Start OneCommander - D3 and Firefox
# 20260922
# last 20260922
# ---

# globals
runff="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"

# RUN
(${runff} &) > /dev/null 2>&1
cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin "D3"

