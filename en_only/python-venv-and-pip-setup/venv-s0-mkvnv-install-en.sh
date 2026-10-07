#! /usr/bin/env bash
# fname: venv-s0-mkvnv-install-en.sh
# descpt: (cygwin) create virtual env for python project, upgrade pip, install dependencies
# 20261001 v1
# last: 20261001
# ---

ptn3="/c/Users/gregor.redelonghi/AppData/Local/Programs/Python/Python310/python.exe"
PY3="./venv/Scripts/python.exe"

# venv_s1
printf "[i] creating virtual environment ./venv ...\n"
${ptn3} -m venv venv

printf "[i] upgrading pip to latest version ...\n"
${PY3} -m pip install --upgrade pip

# venve_s2
FILE=$(realpath ./requirements.txt)
echo $FILE

if [ -f $FILE ]; then
     printf "[i] installing required dependencies from requirements.txt ...\n"
     ${PY3} -m pip install -r requirements.txt
     ${PY3} -m pip list
else
    printf "[W] no requirements.txt file found\n"
fi

printf "[i] To activate venv in cmd run:\n\t.\\\\venv\\\\Scripts\\\\activate[.bat]\n"
printf "[i] done\n\n"

