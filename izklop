#!/bin/bash

clear

gr_mznst=""

while true; do

echo

cat <<PRINT-on-SCREEN
---------------------------------------
1 - odjavi $USERNAME
2 - ponovni zagon
3 - ZAUSTAVITEV
N - nazaj na zze
---------------------------------------
0 - izhod
---------------------------------------
PRINT-on-SCREEN


echo -n "Vnesi stevilko: "

read gr_mznst

echo

case "${gr_mznst}" in

"1" )
shutdown -l -t 05
;;
"2" )
shutdown -r -t 05
;;
"3" )
shutdown -s -t 05
;;
"N" )
clear && source ./zze.sh
break
;;



"0" )
clear
exit 0

;;

* )
echo "NOT IN THE LIST!"
read -p "Press any key to EXIT!"
clear
exit 1

;;

esac
clear

done
