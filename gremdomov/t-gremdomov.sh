#! /bin/bash

### Name:	gremdomov.sh
### Author:	RgregoR
### Date:	20150305 -- updated 20150323 / 20150327
### Decription:
### goinghome (gremdomov) script that runs Dropbox, performs backups, sends home links list, and restarts the comp.
### 
### UPDATE 20181107: remove starting DB -- no indirect update of DB any more ... 
 
# variables declaration

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}



gr_LOGF="$HOME/seznami/gremdomov.log"
(tms; echo "Starting $0") >> ${gr_LOGF}

# clear the screen
clear

# the message:
cat <<EOF
--------------------------------
Final cleaning:
	1 - start bkpall
	2 - send home links list
	3 - REBOOT ...
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
(tms; echo -n "1 - Starting backups ... ") | tee -a ${gr_LOGF}
echo
### bckps && backups-to-drpbx && bekap-drpbx-en
~/majstaf/coding/bekap/bkpall
gr_CMD_2=$?

if [ ${gr_CMD_2} -eq 0 ]; then
    echo "[OK]" >> ${gr_LOGF}
fi

(tms; echo "No backups. [OK]") | tee -a ${gr_LOGF}

# sending home file-list
echo
(tms; echo -n "2 - Sending home links list ... ") | tee -a ${gr_LOGF}
echo
~/majstaf/coding/send_mail/sendhome2filelist.sh
gr_CMD_3=$?

if [ ${gr_CMD_3} -eq 0 ]; then
	echo "[OK]" >> ${gr_LOGF} 
else	
	echo "Nothing to be sent home." >> ${gr_LOGF}
fi


# REBOOT with countdown (depreciated since 20200629)
# echo
# (tms; echo "3 - REBOOT in 10 secs ... ") | tee -a ${gr_LOGF}
# (tms; echo "----------------------------------------") >> ${gr_LOGF}
# echo
# for FFF in $(seq 10 -1 0); do echo -en "  $FFF \r" && sleep 1; done
# shutdown -r 5 "GREM DOMOV. REBOOTING!!"

# REBOOT without countdown
echo
(tms; echo "3 - REBOOT (NOW!) ... ") | tee -a ${gr_LOGF}
(tms; echo "----------------------------------------") >> ${gr_LOGF}
echo
shutdown -r now "GREM DOMOV. REBOOTING!!"

# exit
