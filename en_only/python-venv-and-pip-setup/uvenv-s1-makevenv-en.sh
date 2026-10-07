# fname: uvenv-s1-makevenv-en.sh
# descpt: create virtual env for python project and upgrade pip
# 20261001 v1
# last: 20261001
# ---

ptn3="/usr/bin/python3"
PY3="./venv/bin/python"

printf "[i] creating virtual environment ./venv ...\n"
${ptn3} -m venv venv
${PY3} -m pip install --upgrade pip

printf "[i] to activate venv in cmd run: '. ./venv/bin/activate'\n"
printf "[i] done\n\n"

