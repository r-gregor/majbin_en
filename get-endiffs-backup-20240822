#! /usr/bin/env bash
# get_ndiffs
# last change 20240229 (en)

CURRDIR=$PWD
MJSTFN=${HOME}/majstaf
MJSTFN_G=${MJSTFN}/engit

cd ${MJSTFN_G}/dotfiles_en
echo "[INFO] diffs: dotfiles_en ..."
for FFF in $(ls -1A); do diff -qr $FFF ${HOME}/${FFF} 2>/dev/null | grep -iv 'only'; done
echo "---"

for check_dir in majbin_en majrcs_en metsys_en; do
	cd ${MJSTFN_G}/${check_dir}
	echo "[INFO] diffs: ${check_dir} ..."
	for FFF in $(ls -1); do diff -qr $FFF ${MJSTFN}/${check_dir}/${FFF} | grep -iv 'only'; done
	echo "---"
	cd $HOME
done

cd ${CURRDIR}

