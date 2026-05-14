#! /usr/bin/env bash
# filename: hstl_en
# 20251120 en: create history commands snapshot
# last: 20251120

HISTFILE=~/.bash_history
HISTCONTROL=erasedups
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=5000
export HISTTIMEFORMAT='%F %T '

gPth="$HOME/majstaf/seznami/hstl-en-$(date +'%Y%m%d-%H%M%S').txt"
set -o history
history >> ${gPth}
set +o history
echo "Sccesfully added commands from HISTORY to ${gPth}"


