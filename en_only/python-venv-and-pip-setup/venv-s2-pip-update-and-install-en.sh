#! /usr/bin/env bash
# fname: venv-s2-pip-update-and-install-en.sh
# descpt: (cygwin) upgrade pip and install dependencies in python project
# 20261001 v1
# last: 20261001
# ---

FILE=$(realpath ./requirements.txt)
PY3="./venv/Scripts/python.exe"

if [ -f "${FILE}" ]; then
	printf "[i] updating pip ...\n"
	${PY3} -m pip install --upgrade pip
	printf "[i] installing required dependencies from requirements.txt ...\n"
	${PY3} -m pip install -r requirements.txt
	${PY3} -m pip list
	printf "[i] done\n\n"
else
	printf "[i] no requirements.txt file found\n"
	printf "[i] done\n\n"
fi

