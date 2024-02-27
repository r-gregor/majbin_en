#! /usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "Usage: preimenuj [old-file-name-pattern] [new-file-name-pattern]"
	echo ""
	echo "       01a_pretavitev-Valvasorjeva-PID_NASLOVNA-STRAN.docx"
	echo "           ^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	echo ""
	exit 1
fi

old=$1
new=$2

# DRY RUN -- echo ...
echo "DRY run ..."
for FFF in $(find * -maxdepth 0 -name "*\.doc*" -o -name "*\.xls*"); do
    oldF=${FFF}
    newF=${FFF//${old}/${new}}

    ### if [[ $oldF == $newF ]]; then
    ###     echo "Old and new names are same!"
    ###     exit 1
    ### else
    ###     echo "${oldF} --> ${newF}"
    ### fi
    
    echo "${oldF} --> ${newF}"
done

echo "Continue? [yes/YES]"
read ANS

if [[ $ANS == "yes" || $ANS == "YES" ]]; then
	for FFF in $(find * -maxdepth 0 -name "*\.doc*" -o -name "*\.xls*"); do
        oldF=${FFF}
        newF=${FFF//${old}/${new}}
        
        # TEST
        # echo mv -v ${oldF} ${newF}; done
        
        #RUN
        mv -v ${oldF} ${newF}; done
	echo "Done."
fi
