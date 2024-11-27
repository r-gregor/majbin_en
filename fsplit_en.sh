#! /usr/bin/env bash

PARTS=2
ARGS=("$@")
NUMARGS=${#ARGS[*]}

# test
# echo "NUM of args: ${#ARGS[*]}"

if [ $NUMARGS -eq 0 ]; then
	echo "[ERROR] No filename supplied"
	echo "Usage: $0 <fname> <n>"
	echo "           fname: file name"
	echo "           n:     number of parts to split fname into"
	echo "                  if only <filename> supiplied: n = 2"
	exit
fi

if [ $NUMARGS -eq 2 ]; then
	fname=${ARGS[0]}
	PARTS=${ARGS[1]}
fi

if [ $NUMARGS -eq 1 ]; then
	fname=${ARGS[0]}
fi

if [ ! $fname ]; then
	echo "[ERROR] $fname: No such file"
	exir
fi

echo -n "Command: "
echo "split -n ${PARTS} -d ${fname} ${fname}_part-"
read -p "Continue?"
split -n ${PARTS} -d ${fname} ${fname}_part-
