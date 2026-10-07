# fname: uvenv-s1-makevenv-en.sh
# descpt: (cygwin) create virtual env for python project and upgrade pip
# 20261001 v1
# last: 20261001
# ---

py3="/c/Users/gregor.redelonghi/AppData/Local/Programs/Python/Python310/python.exe"

printf "[i] creating virtual environment ./venv ...\n"
${py3} -m venv venv
./venv/Scripts/python.exe -m pip install --upgrade pip

printf "[i] to activate venv in cmd run:\n\t.\\\\venv\\\\Scripts\\\\activate[.bat]\n"
printf "[i] done!\n"

