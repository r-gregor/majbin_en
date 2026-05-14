#! /bin/bash

### Name:   Scriptname ...
### Author: Author ... 
### Date:   2013_05_24 
### Decription:
### 
### 
### 
 
# TS1=$(date +"%s"); cd /d && /d/METSYS/00_backups_wrapper -d && cd /j && /j/METSYS/00_backups_wrapper -d; TS2=$(date +"%s"); echo "Done in $((TS2-TS1)) seconds."

TP1=$(date +"%s"); { cd /d && /d/METSYS/00_backups_wrapper -d; } & { cd /j && /j/METSYS/00_backups_wrapper -d; } & wait; TP2=$(date +"%s"); echo "Done in $((TP2-TP1)) seconds."
