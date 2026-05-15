#! /usr/bin/env bash
# fname: string-lower-to-upper-en
# v1_20260331
# ---

arg="$@"

BIG=$(echo "$arg" | sed 's/ \././' | tr [:lower:] [:upper:])

echo "$BIG"
echo "$BIG" | putclip # xclip on Linux!

