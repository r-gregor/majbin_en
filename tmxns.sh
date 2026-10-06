#! /usr/bin/env bash
# fname: tmxns.sh
# descpt: run new tmux session with '%H%M%S' as name of the session
# 20261006 v1
# last: 20261006
# ---

DT=$(date +"%H%M%S")
# tmux new-session -s "${DT}"\; split-window -v \; send-keys "${HOME}/majstaf/majbin/BrthReminder/BrthReminder_c_color.exe" Enter
tmux new-session -s "${DT}"\; send-keys "${HOME}/majstaf/majbin/BrthReminder-c/BrthReminder-c-colors.exe" Enter

