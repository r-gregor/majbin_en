#! /usr/bin/env bash
# fname: ve-me
# pipe output of external command into ve-me
# v1_20260402
# last: 20260402
# ---

fzf --reverse -m -e | xargs -ro vim

