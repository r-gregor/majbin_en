#! /usr/bin/env bash
# fname: vv-s
# pipe output of external command into vv-s
# v1_20260402
# last: 20260402
# ---

fzf --reverse | xargs -ro vim -M

