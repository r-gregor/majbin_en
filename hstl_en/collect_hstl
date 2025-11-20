#! /usr/bin/env bash
# filename: collect_hstl
# 20251120 en: collect and filter out all history snapshots till today
# last: 20251120

SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

gr_FJL=commands-history-list-en-by-$(date +"%Y%m%d").txt
touch ${gr_FJL}

# 01-COLLECT-ALL-COMMANDS-from-history-en-dat-to-single-file.onl.txt
export LC_ALL=C
cat $HOME/majstaf/seznami/hstl-en-2025* | cut -b 28- | grep -v -f "${SRCDIR}/excludes-hstl.txt" | sort | uniq -c >> ${gr_FJL}

# 02-REMOVE-count-nums-infront-of-commands-in-single-file.onl.txt
cat commands-history-list-en-by-$(date +"%Y%m%d").txt | cut -b 9- > commands-history-list-en-by-$(date +"%Y%m%d")-2.txt

