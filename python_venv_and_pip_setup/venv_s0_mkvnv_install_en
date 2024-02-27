#! /usr/bin/env bash
ptn3="/c/Users/gregor.redelonghi/AppData/Local/Programs/Python/Python310/python.exe"
PY3="./venv/Scripts/python.exe"

# venv_s1
echo "Creating virtual environment ./venv ..."
${ptn3} -m venv venv

echo "Upgrading pip to latest version ..."
${PY3} -m pip install --upgrade pip

# venve_s2
FILE=$(realpath ./requirements.txt)
echo $FILE

if [ -f $FILE ]; then
     echo "Installing required dependencies from requirements.txt ..."
     ${PY3} -m pip install -r requirements.txt
     ${PY3} -m pip list
     echo "...done"
else
    echo "No requirements.txt file found"
fi

echo -e "To activate venv in cmd run:\n\t.\\\\venv\\\\Scripts\\\\activate[.bat]"
