#! /bin/bash
# fname: t-gremdomov.sh
# descpt: restarts the comp
# 20181107
# last: 20181107
# ---

# timestamp
clear
function tms() {
	printf "[ $(date +%Y%m%d_%H%M%S) ] "
}

tms; printf "[i] starting '%s'\n" "$0"
tms; printf "[i] REBOOTING ...\n"
shutdown -r now "[i] GREM DOMOV. REBOOTING"
