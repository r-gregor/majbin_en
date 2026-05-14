#! /bin/bash

### Name:	ftp-access.sh
### Author:	RgregoR
### Date:	2015-01-15
### Decription:	Script that connects to FTP site for up or down -loading files
### 
### 
### 


### EN - proxy ...
### export ftp_proxy=ftp://172.17.3.64:8021/


# Display menu:

clear

cat <<EOF
FTP acces to [lftp]:

1 - users.volja.net/gregorr
2 - r-gregor.slohosting.com
3 - rgregor.byethost22.com
0 - EXIT
-----------------------------------

EOF

echo -n "Enter 1, 2 or 3 for acces, or 0 to exit  "
read gr_ANSWER

case "${gr_ANSWER}" in

	"1" )
	echo 
	lftp -e 'set ftp:passive-mode 0' 'gregorr:zala00'@ftp.volja.net
	;;

	"2" )
	echo
	lftp -e 'set ftp:passive-mode 0' 'r-gregor.slohosting.com:z7m17s11'@free.slohosting.com
	;;

	"3" )
	echo
	lftp -e 'set ftp:passive-mode 0' 'b22_15819044:z7m17s11'@ftp.byethost22.com
	;;

	"0" )
	echo -e "Bye!\n"
	exit
	;;

	* )
	echo
	echo -e "Enter 0, 1, 3 or 0.\n"
	exit 1
	;;

esac

