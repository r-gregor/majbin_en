#! /usr/bin/env bash

HST="en"

# for DDD in majbin majrcs metsys seznami; do
for DDD in majbin majrcs metsys; do
	check-git-diffs-${HST} $DDD;
done

