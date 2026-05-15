#! /usr/bin/env bash
# fname: venv-s3-remove-venv.sh
# ---

VENVDIR=$(realpath ./venv)
echo $VENVDIR

if [ -d $VENVDIR ]; then
     echo "Removing ./venv ..."
     rm -rv ${VENVDIR}
     echo "Done"
else
    echo "No ${VENVDIR} found"
fi
