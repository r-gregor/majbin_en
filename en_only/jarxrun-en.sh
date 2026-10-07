#! /usr/bin/env bash
# fname: jarxrun-en.sh
# descpt: run *.jar file with javafx module using java -jar (cygwin)
# 20261001 v1
# last: 20261001
# ---

if [ $# -lt 1 ];
	printf "[E] must supply unixpath and/or options\n"
	exit 1
else
	unixpath="$1"
	shift
	rest="$@"
fi

java -jar --module-path $PATH_TO_FX --add-modules=javafx.controls $(cygpath -w $(realpath $unixpath)) $rest

