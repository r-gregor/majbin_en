#! /usr/bin/env bash
# filename: drpbx-rclone-sync-mcdn2d-R-L.sh
# v1_20201111
#---

LOCALMN=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/MCDN_d")
REMOTEMN="dropbox:ODPRTO/MCDN_d"

LOCALJV=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/home_username_majstaf_java_d")
REMOTEJV="dropbox:ODPRTO/home_username_majstaf_java_d"

LOCALMT=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/METSYS_skupno/doma")
REMOTEMT="dropbox:ODPRTO/METSYS_skupno/doma"

function update() {
    FROM=$1
    TO=$2
    echo "Updating remote ${FROM} to local ${TO}"
    /usr/local/bin/rclone -v sync ${FROM} ${TO}
    
    # dry-run
    # /usr/local/bin/rclone -v -n copy ${FROM} ${TO}
    
    if [ $? == 0 ]; then
        echo "Done."
    else
        echo -e "Something went wrong!\n"
        exit 1
    fi
}

update ${REMOTEMN} ${LOCALMN}
update ${REMOTEJV} ${LOCALJV}
update ${REMOTEMT} ${LOCALMT}
