#! /usr/bin/env bash

### Name:	drpbx-rclone-sync-SKUPNI1-L-R.sh
### Author:	RgregoR
### Date:	20201112
### Decription:
### rclone copy gLocal to gRemote
### 
### 

gLocal=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/SKUPNI")
gRemote="dropbox:SKUPNI"

function update() {
    gFrom=$1
    gTo=$2
    echo "Updating local ${gFrom} to remote ${gTo}"
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

update ${gLocal} ${gRemote}
