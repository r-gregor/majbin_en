#! /usr/bin/env bash

### 

if [ $# -eq 1 ]; then
	NN=$1
else
	NN=4
fi

tmp_stmp=$(date +"%Y%m%d_%H%M")

FJL=$(find * -maxdepth 0 -name "_*.pdf")
PTH=$PWD
PROJ=$(echo $PTH |cut -d'/' -f7)
NRCL=narocilo_${tmp_stmp}.txt

msg() {
cat << EOF
Naročilo: ${tmp_stmp}_${PROJ}
SM=5300

Naročam ${NN}x plot celotnega načrta:
${FJL}

Vse obrezano in zloženo!



LP,




EOF
}

msg > ${NRCL}
echo "---" >> ${NRCL}
echo $(cygpath -w "$PWD") >> ${NRCL}
${HOME}/.local/bin/np ${NRCL}

