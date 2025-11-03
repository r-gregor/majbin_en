#! /usr/bin/env bash

### Name:	drpbx-rclone-txt2-R-L.sh
### Author:	RgregoR
### Date:	20201111
### Decription:
### sync local ODPRTO/_TXT to dropbox(EN) with rclone
### 
### 


gLocal=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/_TXT") 
gRemote="dropbox:ODPRTO/_TXT"

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
