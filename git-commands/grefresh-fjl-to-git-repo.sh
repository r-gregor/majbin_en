#! /usr/bin/env bash
# filename: grefresh-fjl-to-git-repo
# 20241216
# 20250415

if [ $# -ne 1 ]; then
	echo -e "Usage: $0 <file-name>\n\n"
	exit
else
	fname=$1
	usr=en
fi

curdir="$(basename $PWD)"
# destdir="$(echo $PWD | sed "s:majstaf:majstaf/${usr}git:")"
destdir="$(echo $PWD | sed "s:majstaf/\(.*\):majstaf/${usr}git/\1:" | sed "s:\.config:majstaf/${usr}git/dotfiles_${usr}/.config:")"

read -p "cp -i ./${fname} ${destdir}/${fname} ?"
cp -v ./${fname} ${destdir}/${fname}

