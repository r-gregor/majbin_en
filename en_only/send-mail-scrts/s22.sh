#! /usr/bin/env bash
# fname: s22.sh
# descpt: send-2args-en with same subject and body
# v1_20260601
# ---

if [ $# -ne 1 ]; then
	printf "[E] usage: s22 <subject/body>\n\n"
	exit 1
fi

send-2args-en "$@" "$@"

