#! /bin/bash

### Name:	gremdomov_vknd.sh
### Author:	RgregoR
### Date:	20150305 -- updated 20150323 / 20150327
### Decription:
### goinghome (gremdomov-vknd) script that runs Dropbox, performs backups, sends home links list, and SHUTSDOWN the comp.
### 
### UPDATE 20181107: remove starting DB -- no indirect update of DB any more ... 

# variables declaration
gr_LOGF="$HOME/seznami/gremdomov.log"

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


tms; echo "starting gremdomov log" >> ${gr_LOGF}

# clear the screen
clear

# the message:
cat <<EOF
--------------------------------
Final cleaning:
	1 - start bkpall
	2 - send home links list
	3 - SHUTDOWN ...
--------------------------------

EOF

### DROPBOX start REMOVED ### DROPBOX start REMOVED ### DROPBOX start REMOVED ### DROPBOX start REMOVED ###
### # start the Dropbox
### tms; echo -n "1 - Starting DropBox ... " | tee -a ${gr_LOGF}
### cygstart /c/Users/gregor.redelonghi/AppData/Roaming/Dropbox/bin/Dropbox.exe
### gr_CMD_1=$?
### sleep 10
### 
### if [ ${gr_CMD_1} -eq 0 ]; then
###        echo "[OK]" | tee -a ${gr_LOGF} 
### fi
### DROPBOX start REMOVED ### DROPBOX start REMOVED ### DROPBOX start REMOVED ### DROPBOX start REMOVED ###

# start backups
echo
tms; echo "1 - Starting backups ... " | tee -a ${gr_LOGF}
echo
bkpall
gr_CMD_2=$?

if [ ${gr_CMD_2} -eq 0 ]; then
       echo "[OK]" >> ${gr_LOGF} 
fi

# sending home file-list
echo
tms; echo "1 - Sending home links list ... " | tee -a ${gr_LOGF}
echo
~/majstaf/coding/sendhome2filelist.sh

gr_CMD_3=$?

if [ ${gr_CMD_3} -eq 0 ]; then
	echo "[OK]" >> ${gr_LOGF} 
else	
	echo "Nothing to be sent home." >> ${gr_LOGF}
fi

### sleep 5


# SHUTDOWN with countdown (depreciated since 20200629)
# echo
# tms; echo "3 - SHUTDOWN in 10 secs ... " | tee -a ${gr_LOGF}
# tms; echo "----------------------------------------" >> ${gr_LOGF}
# for FFF in $(seq 10 -1 0); do echo -en "  $FFF \r" && sleep 1; done
# shutdown -h 5 "GREM DOMOV. SHUTING DOWN ..."

# SHUTDOWN without countdown
echo
tms; echo "3 - SHUTDOWN (NOW!) ... " | tee -a ${gr_LOGF}
tms; echo "----------------------------------------" >> ${gr_LOGF}
shutdown -h -s now "GREM DOMOV. SHUTING DOWN ..."

exit
