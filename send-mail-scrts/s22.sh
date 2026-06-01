#! /usr/bin/env bash
# fname: s22.sh
# v1_20260601
# ---

# send-2args-en with same subject and body

if [ $# -ne 1 ]; then
	printf "Usage: s22 [subject/body]\n\n"
	exit
fi

send-2args-en "$@" "$@"

