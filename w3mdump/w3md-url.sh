#! /usr/bin/env bash
# fname: w3md-url.sh
# v1_20260611
# ---

###  EN-proxy ...
# prx_ip=172.17.3.64
prx_ip=10.91.8.21
export http_proxy=http://${prx_ip}:80/
export ftp_proxy=ftp://${prx_ip}:8021/
export https_proxy=http://${prx_ip}:80/

danes=$(date +"%Y%m%d")

usage() {
    cat <<EOF

    Usage: w3md-url <"URL"> <prefix>
                       URL:    between double quotes ("https://...")
                       prefix: cathegory (c, ptn, jv, go, ...)
                               if no cathegory: prefix == '0'

EOF
}

if [ $# -ne 2 ]; then
	usage
	exit
else
	URL="${1}"
	prefix="${2}"
fi

if [[ ${URL:${#URL}-1} == "/" ]]; then
	FINAL_URL=${URL:1:${#URL}-2}
else
	FINAL_URL=${URL}
fi

# TEST
# printf "final URL: $FINAL_URL\n"
# read -p "OK?"

if [[ ${prefix} == 0 ]]; then
	fname=$(echo "${FINAL_URL##*/}" | tr '_' '-' | tr '[[:upper:]]' '[[:lower:]]' | sed -e 's/-in-c//g' -e 's/-in-linux//g')
else
	fname=$(echo "${prefix}-${FINAL_URL##*/}" | tr '_' '-' | tr '[[:upper:]]' '[[:lower:]]' | sed -e 's/-in-c//g' -e 's/-in-linux//g')
fi

dest="${fname}-${danes}.txt"

# TEST
# printf "dest: %s\n" "${dest}"
# read -p "OK?"

if [[ -f "${dest}" ]]; then
	printf "[ERROR] file: '%s' exists\n\n" "${dest}"
	exit
fi

echo "filename: ${dest}" >> ${dest}
echo -e "${URL}\n\n" >> ${dest}
w3m -dump -cols 110 ${URL} >> ${dest}
printf "\n\n---\n" >> ${dest}
printf "[INFO] fname created: '%s'\n\n" "${dest}"

