#! /usr/bin/env bash
# filename: ghgl-push-en.sh
# v1_20240823
# last: 20240823
# ---

rmts=( $(git remote) )

for rmt in "${rmts[@]}"
do
	echo "[INFO] git push to: $(git remote get-url ${rmt}) ..."
	git push ${rmt} main
	echo "---"
done

