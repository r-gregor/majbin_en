#! /bin/bash

### script:	30najvecjih.sh
### opis:	poisce in izpise 30 najvecjih map in datotek
###		sortirane po velikosti porabljenega prostora
###		na disku (30.najvecjih.[datestamp].txt) in to datoteko
###             shrani v /home/seznami/
### -----------------------------------------------------------------


# Variables:
gr_DATE=$(date +%Y%m%d_%H%M)
gr_DEST1="${HOME}/majstaf/seznami"
gr_FILE1="30.najvecjih_${gr_DATE}.txt"
gFinalDest=${gr_DEST1}/${gr_FILE1}

echo "Creating ${gFinalDest}..."
touch ${gFinalDest}
 

### gr_IZHD=$PWD
gr_IZHD="/c"
gr_SZNM=~/.tmp/list.dat
gr_DIRSI=~/.tmp/list-by-size.dat

gr_ST_ZNAKOV=85

function grf_crtice () {
	printf "%${gr_ST_ZNAKOV}s\n" | tr " " "-"	# draw a line of "-" number-of-chars times ...
	}
	
grf_crtice
printf "%s\n" "[ $(date +%Y%m%d_%H%M) ] starting script \"$0\" ..."

grf_crtice

if [ -f ${gr_SZNM} ]; then
	rm -vvv ${gr_SZNM}
fi

if [ -f ${gr_DIRSI} ]; then
	rm -vvv ${gr_DIRSI}
fi

du -h --max-depth=1 ${gr_IZHD} 2>/dev/null | sort -hr | head -n 30 >> ${gr_DIRSI}

grf_crtice
cat -n ${gr_DIRSI} | tee ${gFinalDest}

cat ${gr_DIRSI} | awk '{$1=""; print $0}' >> ${gr_SZNM}


while read F; do 	
	echo "---------------------------------------------------------------" >>  ${gFinalDest}
	du -ah --max-depth=2 "${F}/" 2> /dev/null | sort -hr | head -n5 >> ${gFinalDest}

done <${gr_SZNM}
grf_crtice

