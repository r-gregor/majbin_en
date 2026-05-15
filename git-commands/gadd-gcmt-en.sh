#! /usr/bin/env bash
# filename: gadd-gcmt-en.sh
# v1_20240912
# last: 20240912
# ---

gcmd="/usr/bin/git add --verbose ."
gcmt="${HOME}/.local/bin/gcommit-timestamp-en"


# display and run commands
echo -en "running: ${gcmd}\n" && ${gcmd}
echo
echo -en "running: ${gcmt}\n" && ${gcmt}

