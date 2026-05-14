#! /usr/bin/env bash

TARGET=$PWD

OUT="${TARGET}/zig-out"
CCH="${TARGET}/.zig-cache"

if [ ! -d ${OUT} ]; then
	echo -e "[ERROR] no '${OUT}' dir\n"
	exit
fi

if [ ! -d ${CCH} ]; then
	echo -e "[ERROR] no '${CCH}' dir\n"
	exit
fi

echo "Dirs to remove:" 
echo "${OUT}"
echo "${CCH}"
read -p "OK ?"

rm -rv ${OUT} ${CCH}

