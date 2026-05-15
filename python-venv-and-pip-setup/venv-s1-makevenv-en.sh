#! /usr/bin/env bash
# fname: venv-s1-makevenv-en.sh
# ---

py3="/c/Users/gregor.redelonghi/AppData/Local/Programs/Python/Python310/python.exe"

echo "Creating virtual environment ./venv ..."
${py3} -m venv venv
./venv/Scripts/python.exe -m pip install --upgrade pip

echo -e "To activate venv in cmd run:\n\t.\\\\venv\\\\Scripts\\\\activate[.bat]"

echo "Done!"

