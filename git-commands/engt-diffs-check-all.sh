#! /usr/bin/env bash
# fname: engt-diffs-check-all.sh
# v1_20260514
# ---

HST="en"

# for DDD in majbin majrcs metsys seznami; do
for DDD in majbin majrcs metsys; do
	check-git-diffs-${HST} $DDD;
done

