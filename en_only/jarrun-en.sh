#! /usr/bin/env bash
# fname: jarrun-en.sh
# descpt: run *.jar file with java -jar (cygwin)
# 20261001 v1
# last: 20261001
# ---

unset unixpath
unset rest

if [ $# -lt 1 ];
	printf "[E] must supply unixpath and/or options\n"
	exit 1
else
	unixpath="$1"
	shift
	rest="$@"
fi

java -jar $(cygpath -w $(realpath "${unixpath}")) "${rest}"
