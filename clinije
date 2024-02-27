#! /bin/bash

### clinije.sh
### copies [linije.shx] file from /c/users/gredelonghi ... /SHAPE datoteke/
### to all directories named *_risbe*, where file doesn't exist.

### last change: 20140116: changed gr_PATH and gr_DPATH variables

gr_MAJDOCS="//jhl.si/dfs/jpe/home/gregor.redelonghi"
gr_GRDLNGH="/c/Users/gregor.redelonghi"

gr_SPATH="${gr_MAJDOCS}/energetika/en_projekti-podloge/en_AutoCAD_support-files/SHAPE datoteke"
gr_DPATH="${gr_GRDLNGH}/2014"
gr_SFILE=linije.shx

for AAA in $(find "${gr_DPATH}"/ -type d -name "*risb*"); do

    if [ ! -e  "${AAA}"/"${gr_SFILE}" ]; then
        cp -vvv "${gr_SPATH}"/"${gr_SFILE}" "${AAA}"/
    fi

done

echo
echo '... DONE!'

