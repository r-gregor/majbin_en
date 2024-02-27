#! /usr/bin/bash
unixpath=$1
shift
rest="$@"

java -jar --module-path $PATH_TO_FX --add-modules=javafx.controls $(cygpath -w $(realpath $unixpath)) $rest
