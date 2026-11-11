#! /usr/bin/env bash
# fname: tmxns.sh
# descpt: run new tmux session with '%H%M%S' as name of the session
# 20261006 v1
# last: 20261006
# ---


# === GLOBALS ===
cmd="${HOME}/majstaf/majbin/en_only/BrthReminder-c/BrthReminder-c-colors.exe"
# cmd=~/.local/bin/BrthReminder-c-colors

# # === MAIN ===
DT=$(date +"%H%M%S")
# NO GOOD: sends command to prompt (2x) before opens window
# put sleep 1 command between new-session and send-keys tmux commands
# tmux new-session -s "${DT}"\; send-keys "${cmd}" Enter

# new 20261111
tmux new-session -d -s "${DT}"
sleep 1
tmux send-keys -t "${DT}" "${cmd}" Enter
tmux attach -t "${DT}"
