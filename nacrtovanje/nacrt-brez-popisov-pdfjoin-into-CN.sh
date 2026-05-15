#! /usr/bin/env bash
# fname: nacrt-brez-popisov-pdfjoin-into-CN.sh
# ---

pdfjoin="java -jar $(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/pdftk-all.jar")"

printf "enter path for T (teksti pdf):\n"
read -e TEKSTI
echo

printf "enter path for R (risbe pdf):\n"
read -e RISBE
echo

# command:
$pdfjoin T=${TEKSTI} R=${RISBE} cat T R output __CN2.pdf

