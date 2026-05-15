#! /usr/bin/env bash
# filename: drpbx-rclone-jv2-R-L.sh
# v1_20201111
#---

gLocal=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/_JAVA") 
gRemote="dropbox:ODPRTO/_JAVA"

function update() {
    gFrom=$1
    gTo=$2
    echo "Updating remote ${gFrom} to local ${gTo}"
    /usr/local/bin/rclone -v sync ${gFrom} ${gTo}

    # dry-run
    # /usr/local/bin/rclone -v -n sync ${gFrom} ${gTo}
    
    if [ $? == 0 ]; then
        echo "Done."
    else
        echo -e "Something went wrong!\n"
        exit 1
    fi
}

update ${gRemote} ${gLocal}
