#! /usr/bin/env bash
# fname: remove-all-commented-lines-c.sh
# descpt: remove ALL commented lines from c-file
# 20261001 v1
# last: 20261001
# ---

if [ $# -ne 1 ]; then
	printf "[E] usage: remove-all-commented-lines-c <filename.c>\n\n"
	exit 1
else
	fname_c="$1"
fi

if [ ! -f "${fname_c}" ]; then
	printf "[E] filename ${fname_c} does NOT exist!\n\n"
	exit 1
fi

sed -e '/^\s*\/\/ /d' -e '/^\s*\//d' -e '/^\s*\*\//d' -e '/^\s*\* /d' "${fname_c}"
printf "[i] done\n"

