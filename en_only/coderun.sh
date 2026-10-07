#! /bin/bash
# filename: coderun.sh
# descpt: run VScode (Cygwin)
# 20260928
# last: 20260928
# ---

if [ $# -eq 1 ]; then
    unixpath=$1
else
    unixpath=$(realpath $PWD)
fi

cmmd="cygstart /c/Users/gregor.redelonghi/majstaf_en/myprogs/VSCode*/Code.exe"

winpath=$(cygpath -w ${unixpath})

$cmmd ${winpath}
