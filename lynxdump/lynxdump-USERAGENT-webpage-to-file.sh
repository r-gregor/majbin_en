#! /usr/bin/env bash

###  EN-proxy ...
# prx_ip=172.17.3.64
prx_ip=10.91.8.21
export http_proxy=http://${prx_ip}:80/
export ftp_proxy=ftp://${prx_ip}:8021/
export https_proxy=http://${prx_ip}:80/

clear
gr_dejt=$(date +%Y%m%d)

if [ $# -ne 2 ]; then
	echo -e "USAGE: <scriptmname> [web-URL] [filename-with-dashes]\n"
	exit
fi

gr_weburl="$1"
gr_fjl="$2"
gr_flnm="${gr_fjl}-${gr_dejt}.txt"

printf "%-20s%s\n" "Web URL:" "${gr_weburl}"
printf "%-20s%s\n\n" "filename:" "${gr_flnm}"

read -p "Press <enter> to proceed or <ctrl-c> to quit"

echo -e "${gr_weburl}\n\n" >> ${gr_flnm}
lynx -useragent="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" -dump -width=110 ${gr_weburl} >> ${gr_flnm}

echo -e "\n\n---\n" >> ${gr_flnm}

echo
echo -e "DONE!\n"

