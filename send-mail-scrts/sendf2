#! /bin/bash

### Name:	sendfiles.sh
### Author:	RgregoR
### Date:	2014-09-26
### script that sends l from CLI over <sendEmail (WinXP cmd)>
### 
### UPDATE: 2017-03-21: import connection data from external file "send_config_en.conf"
### 
### 
# check if there is one and only on argument:
# putting argument into variable


# NOVO 2017-03-21
gConfPth="$HOME/majstaf/majbin/send-mail-scrts"
source "${gConfPth}/send_config_en.conf"

# NOVO 20171123
# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


# START
tms; echo "Starting $0 ..."

# check if there is one and only on argument:
# putting argument into variable
gTmStmp="$(date +%Y%m%d-%H%M%S)"
gCmdPth='/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/sendEmail-v156_noTLS'	# path to command = sendEmail
sendEmail-v156_noTLS
gr_xu=${gUnm}						# username for SMTP server
gr_xp=${gPsswd}						# password for SMTP server
gSmtp=${gSmtp}						# SMTP:port
gr_frm=${gFrom}						# from: sender
gr_rcp=${gTo}						# to: recipient

# checkig if there is only one parameter
if [ $# -ne 1 ]; then
	tms; echo -e "Usage: sendfiles.sh [/c/path/to/file]\n"
	exit 1
fi

gAttf="$1"

tms; echo -n "Checking if file exists ... "
if [ ! -f "${gAttf}" ]; then
 	tms; echo -e "There is no ${gAttf}\n"
	exit 1
else
	echo "OK"
fi

tms; echo "Do you really want to send home file:"
tms; echo -e "[ ${gAttf} ]\n"
tms; read -p "Press any key to confirm, or ctlr+c to quit _"

# executing command
### echo -e "\n${gCmdPth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u \"danes-en: ${gTmStmp}\" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a \"$(cygpath -w ${gAttf})\" -m \"danes-en: ${gTmStmp}\""
${gCmdPth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u "danes-en: ${gTmStmp}" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a "$(cygpath -w ${gAttf})" -m "danes-en: ${gTmStmp}" 

