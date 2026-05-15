#! /usr/bin/env bash
# fname: ve-m
# pipe output of external command into vvse
# v1_20260402
# last: 20260402
# ---

# ve-m
fzf --reverse -m | xargs -ro vim
