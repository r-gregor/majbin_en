#! /usr/bin/env bash
# fname: uvenv-s0-mkvnv-install-en.sh
# descpt: create virtual env for python project, upgrade pip, install dependencies
# 20261001 v1
# last: 
# ---

ptn3="/usr/bin/python3"
PY3="./venv/bin/python"

# venv_s1
printf "[i] creating virtual environment ./venv ...\n"
${ptn3} -m venv venv

printf "[i] upgrading pip to latest version ...\n"
${PY3} -m pip install --upgrade pip

# venve_s2
FILE=$(realpath ./requirements.txt)

if [ -f "${FILE}" ]; then
     printf "[i] installing required dependencies from requirements.txt ...\n"
     ${PY3} -m pip install -r requirements.txt
     ${PY3} -m pip list
else
    printf "[W] no requirements.txt file found\n"
fi

printf "[i] to activate venv in cmd run: . ./venv/bin/activate\n"
printf "[i] done\n\n"

