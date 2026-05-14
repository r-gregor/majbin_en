#! /bin/bash

gr_LAST="$(ls -1t $HOME/majstaf/seznami/* | head -n1)"

clear
echo displaying: ${gr_LAST}
echo "-----------------------------------------"
# cat -n "${gr_LAST}"
cat "${gr_LAST}"
