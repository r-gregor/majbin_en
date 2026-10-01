#! /usr/bin/env bash
# fname: jvfx-compile.sh
# descpt: compile java file with javafx module
# 20261001 v1
# last: 
# ---

unset SC_NAME

if [ $# -ne 1 ]; then
	printf "[E] must supply a filename (without .java ext)\n"
	exit 1
else
	SC_NAME="$1"
fi

# javac --module-path "${PATH_TO_FX}" --add-modules=javafx.controls "${SC_NAME}.java"
javac --module-path "${PATH_TO_FX}" --add-modules=javafx.controls "${SC_NAME}"
