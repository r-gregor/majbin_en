#! /bin/bash
# fname: sendf2.sh
# descpt: send file using 'sendEmail-v156_noTLS'
# v1_20140926
# v2_20170321 import connection data from external file "send_config_en.conf"
#             check if there is one and only on argument:
#             putting argument into variable
# 20261002
# last 20261002
# ---

gConfPth="$HOME/majstaf/majbin/send-mail-scrts"
source "${gConfPth}/send_config_en.conf"

# START
echo "Starting $0 ..."

# check if there is one and only on argument:
# putting argument into variable
gTmStmp="$(date +%Y%m%d-%H%M%S)"


# path to command = sendEmail
gCmdPth='/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/sendEmail-v156_noTLS'
sendEmail-v156_noTLS

gr_xu=${gUnm}        # username for SMTP server
gr_xp=${gPsswd}      # password for SMTP server
gSmtp=${gSmtp}       # SMTP:port
gr_frm=${gFrom}      # from: sender
gr_rcp=${gTo}        # to: recipient

# checkig if there is only one parameter
if [ $# -ne 1 ]; then
	echo -e "Usage: sendfiles.sh [/c/path/to/file]\n"
	exit 1
fi

gAttf="$1"

if [ ! -f "${gAttf}" ]; then
	printf "[E] no such file '%s'\n\n" "${gAttf}"
	exit 1
fi

echo "[?] send home file: '%s'?\n" "${gAttf}"
read -r -p "i[?] press any key to confirm, or ctlr+c to quit: "

# executing command
### echo -e "\n${gCmdPth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u \"danes-en: ${gTmStmp}\" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a \"$(cygpath -w ${gAttf})\" -m \"danes-en: ${gTmStmp}\""
${gCmdPth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u "danes-en: ${gTmStmp}" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a "$(cygpath -w ${gAttf})" -m "danes-en: ${gTmStmp}" 

