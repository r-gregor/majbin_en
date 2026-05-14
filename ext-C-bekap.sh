#! /bin/bash

### Name:   Scriptname ...
### Author: Author ... 
### Date:   2013_05_24 
### Decription:
### 
### 
### 
 
# TS1=$(date +"%s"); cd /d && /d/METSYS/00_backups_wrapper -c && cd /j && /j/METSYS/00_backups_wrapper -c; TS2=$(date +"%s"); echo "Done in $((TS2-TS1)) seconds."

TP1=$(date +"%s"); { cd /d && /d/METSYS/00_backups_wrapper -c; } & { cd /j && /j/METSYS/00_backups_wrapper -c; } & wait; TP2=$(date +"%s"); echo "Done in $((TP2-TP1)) seconds."