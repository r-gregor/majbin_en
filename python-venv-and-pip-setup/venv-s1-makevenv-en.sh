#! /usr/bin/env bash

py3="/c/Users/gregor.redelonghi/AppData/Local/Programs/Python/Python310/python.exe"

echo "Creating virtual environment ./venv ..."
${py3} -m venv venv
./venv/Scripts/python.exe -m pip install --upgrade pip

echo -e "To activate venv in cmd run:\n\t.\\\\venv\\\\Scripts\\\\activate[.bat]"

echo "Done!"

