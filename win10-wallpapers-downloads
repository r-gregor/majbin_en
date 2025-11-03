#! /usr/bin/env bash
# filename: win10-wallpapers-downloads.sh

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# today
danes="win10wallpapers_$(date +%Y%m%d)"

# START
tms; echo "Starting $0 ..."


function testcmd() {
    if [ $? -eq 0 ]; then
        echo "[OK]"
    else
        echo -e "Something went wrog!\n"
        exit 1
    fi
}

source="/c/Users/gregor.redelonghi/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets"
dest="/c/Users/gregor.redelonghi/majstaf_en/en_staf/WIN10wallpapers/${danes}"


if [ -d ${dest} ]; then
    tms; echo -e "Directory ${dest} exists!\n"
    exit 1
else
    \mkdir ${dest}
fi

tms; echo -n "Copying WIN10 wallpapers to ${dest} ... "
\cp ${source}/* ${dest}/
testcmd

tms; echo -n "Renaming walpapers to *.jpg files ... "
cd $dest
for FFF in $(\ls -1 ${dest}/*); do \mv ${FFF} ${FFF}.jpg; done
testcmd

cygstart "explorer" $(cygpath -w "${dest}")

tms; echo "Done!"
