#! /usr/bin/env bash
# fname: engt-diffs-check-all.sh
# descpt: Check for files/dirs that are in source-dir but not in git-repository
# v1_20260514
# ---

HST="en"

# for DDD in majbin majrcs metsys seznami; do
for DDD in majbin majrcs metsys; do
	gcheck-git-diffs-${HST} "$DDD";
done

