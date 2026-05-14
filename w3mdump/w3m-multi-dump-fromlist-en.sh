#! /usr/bin/env bash

# filename: w3m-multi-dump-fromlist-en
# 20260106 v1 en: remove option to use dumplist
# last: 20260106
# ---

###  EN-proxy ...
# prx_ip=172.17.3.64
prx_ip=10.91.8.21
export http_proxy=http://${prx_ip}:80/
export ftp_proxy=ftp://${prx_ip}:8021/
export https_proxy=http://${prx_ip}:80/

if [ $# -eq 1 ]; then
	gr_seznam=$1
	gr_name="default-fname"
	if [ ! -f $gr_seznam ]; then
		echo -e "[ERROR] no such file: ${gr_seznam}\n"
		exit
	fi
elif [ $# -eq 2 ]; then
	gr_seznam=$1
	if [ ! -f $gr_seznam ]; then
		echo -e  "[ERROR] no such file: ${gr_seznam}\n "
		exit
	fi
	gr_name=$2
else
	echo -e " Usage:"
	echo -e "      \t$(basename $0) <list> <name>"
	echo -e "    or:"
	echo -e "      \t$(basename $0) <list> [default-fname]"
	echo -e ""
	exit
fi

#############################################################################################################
gr_dest="$PWD"
gr_dejt=$(date +%Y%m%d)
gr_filename=${gr_name}-multif-${gr_dejt}.txt

# destination ...
gr_goto="${PWD}"
echo "Destination: ${gr_goto}/${gr_filename}"

# If OK pres any key, else ctrl-c ...
read -p "Continue ?"
cd $gr_goto
touch ${gr_filename}

echo "filename: ${gr_filename}" >> ${gr_filename}

for FFF in $(cat ${gr_seznam}); do echo "inserting $FFF into ${gr_filename}"; done
# for FFF in $(cat ${gr_seznam}); do echo -e "$FFF\n" >> ${gr_filename}; lynx -dump -width=110 $FFF >> ${gr_filename}; echo -e "\n\n\n---" >> ${gr_filename}; done
for FFF in $(cat ${gr_seznam}); do echo -e "$FFF\n" >> ${gr_filename}; w3m  -dump -cols 110  $FFF >> ${gr_filename}; echo -e "\n\n\n---" >> ${gr_filename}; done

echo
echo  -e "DONE!\n"

#############################################################################################################
#
# gr_dest="$PWD"
# gr_d_filename="default-filename"
# gr_dejt=$(date +%Y%m%d)
# 
# echo "Enter filename [no spaces, only hypens] :"
# read gr_ANS
# 
# if [ -z ${gr_ANS} ]; then
# 	gr_filename=${gr_d_filename}-multyf-${gr_dejt}.txt
# else
# 	gr_imef=$(echo "${gr_ANS}" | tr ' ' '-') 
# 	gr_filename=${gr_imef}-multif-${gr_dejt}.txt
# fi
# 
# # destination ...
# gr_goto="${PWD}"
# echo "Destination: ${gr_goto}/${gr_filename}"
# 
# # If OK pres any key, else ctrl-c ...
# read -p "Continue ?"
# cd $gr_goto
# touch ${gr_filename}
# 
# echo "filename: ${gr_filename}" >> ${gr_filename}
# 
# for FFF in $(cat ${gr_seznam}); do echo "inserting $FFF into ${gr_filename}"; done
# for FFF in $(cat ${gr_seznam}); do echo -e "$FFF\n" >> ${gr_filename}; w3m -dump -cols 110 $FFF >> ${gr_filename}; echo -e "\n\n\n---" >> ${gr_filename}; done
# 
# echo
# echo 'DONE!'
# echo

