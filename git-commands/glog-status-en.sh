#! /usr/bin/env bash
# filename: glog-status-en
# last change: 20240823


# for myopt in raw numstat shortstat dirstat summary name-only name-status check; do
# 	echo -e "*** git log --${myopt} ***"
# 	git log --${myopt} | head -n 15
# 	echo -e "---\n"
# done

if [ -d .git ] || [ -f HEAD ]; then
	/usr/bin/git log --name-status
else
	echo -e "NOT a git repository!!\n"
	exit
fi

