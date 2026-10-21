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

# === GLOBALS ===
configf_pth="$HOME/majstaf/majbin/send-mail-scrts"
cmd_pth='/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/sendEmail-v156_noTLS'
gr_xu=${gUnm}        # username for SMTP server
gr_xp=${gPsswd}      # password for SMTP server
gSmtp=${gSmtp}       # SMTP:port
gr_frm=${gFrom}      # from: sender
gr_rcp=${gTo}        # to: recipient


# === MAIN ===

if [ $# -ne 1 ]; then
	printf "[e] usage: sendfiles.sh [/c/path/to/file]\n\n"
	exit 1
else
	fjl_attach="$1"
	if [ ! -f "${fjl_attach}" ]; then
		printf "[e] no such file '%s'\n\n" "${fjl_attach}"
		exit 1
	fi
fi

source "${configf_pth}/send_config_en.conf"
printf "[?] send home file: '%s'?\n" "${fjl_attach}"
read -r -p "[?] press any key to confirm, or ctlr+c to quit: "

### echo -e "\n${cmd_pth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u \"danes-en: ${gTmStmp}\" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a \"$(cygpath -w ${fjl_attach})\" -m \"danes-en: ${gTmStmp}\""
${cmd_pth}/sendEmail -xu ${gr_xu} -xp ${gr_xp} -u "danes-en: ${gTmStmp}" -s ${gSmtp} -f ${gr_frm} -t ${gr_rcp} -a "$(cygpath -w ${fjl_attach})" -m "danes-en: ${gTmStmp}"

printf "\n"

