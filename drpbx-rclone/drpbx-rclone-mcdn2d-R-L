#! /usr/bin/env bash

### Name:	drpbx-rclone-mcdn2d-R-L.sh
### Author:	RgregoR
### Date:	20201111
### Decription:
### rclone copy gRemote(d) to gLocal(d)
### 
### 

gLocalMN=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/MCDN_d")
gRemoteMN="dropbox:ODPRTO/MCDN_d"

gLocalJV=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/home_username_majstaf_java_d")
gRemoteJV="dropbox:ODPRTO/home_username_majstaf_java_d"

gLocalMT=$(cygpath -w "/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO/METSYS_skupno/doma")
gRemoteMT="dropbox:ODPRTO/METSYS_skupno/doma"

function update() {
    gFrom=$1
    gTo=$2
    echo "Updating remote ${gFrom} to local ${gTo}"
    /usr/local/bin/rclone -v copy ${gFrom} ${gTo}
    
    # dry-run
    # /usr/local/bin/rclone -v -n copy ${gFrom} ${gTo}
    
    if [ $? == 0 ]; then
        echo "Done."
    else
        echo -e "Something went wrong!\n"
        exit 1
    fi
}

update ${gRemoteMN} ${gLocalMN}
update ${gRemoteJV} ${gLocalJV}
update ${gRemoteMT} ${gLocalMT}
