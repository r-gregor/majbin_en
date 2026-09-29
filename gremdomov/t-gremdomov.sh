#! /bin/bash
# fname: t-gremdomov.sh
# descpt: restarts the comp
# 20181107
# last: 20181107
# ---

# timestamp
function tms() {
	printf "[ $(date +%Y%m%d_%H%M%S) ] "

clear
tms; printf "[i] starting '%s'\n" "$0"
tms; printf "[i] REBOOTING ...\n"
shutdown -r now "[i] GREM DOMOV. REBOOTING"
