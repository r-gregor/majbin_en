#! /bin/bash
# fname: v-gremdomov.sh
# descpt: shutdown the comp
# 20181107
# last: 20181107
# ---

# timestamp
function tms() {
	printf "[ $(date +%Y%m%d_%H%M%S) ] "

clear
tms; printf "[i] starting '%s'\n" "$0"
tms; printf "[i] shuting down ...\n"
shutdown -h -s now "[i] GREM DOMOV. SHUTING DOWN ..."

