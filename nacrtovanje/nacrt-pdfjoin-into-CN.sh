#! /usr/bin/env bash
# filename: nacrt-pdfjoin-into-CN.sh

pdfjoin="java -jar $(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/pdftk-all.jar")"

printf "enter path for T (teksti pdf):\n"
read -e TEKSTI
echo

printf "enter path for R (risbe pdf):\n"
read -e RISBE
echo


printf "enter path for P (popisi pdf):\n"
read -e POPISI
echo

# command:
$pdfjoin T=${TEKSTI} R=${RISBE} P=${POPISI} cat T1-r2 P Tr1-end R output __CN2.pdf

