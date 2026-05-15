#! /usr/bin/env bash
# fname: vv-se
# pipe output of external command into vv-se
# v1_20260402
# last: 20260402
# ---

fzf --reverse -e | xargs -ro vim -M

