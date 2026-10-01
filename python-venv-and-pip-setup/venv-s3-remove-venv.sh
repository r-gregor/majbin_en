#! /usr/bin/env bash
# fname: venv-s3-remove-venv.sh
# descpt: remove virtual env in python project
# 20261001 v1
# last: 20261001
# ---

VENVDIR=$(realpath ./venv)
printf "${VENVDIR}\n"

if [ -d "${VENVDIR}" ]; then
	printf "[i] removing ./venv ...\n"
	rm -rv "${VENVDIR}"
	printf "[i] done\n"
else
	printf "[E] no ${VENVDIR} found\n"
	exit 1
fi
