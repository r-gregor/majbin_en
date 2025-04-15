#! /usr/bin/env bash
# nvol_testpush_all
# last change: 20240823

HST="en"

export VOLGITDIR="${HOME}/majstaf/${HST}git/vlpprs_${HST}"
export VOLWORKDIR="/c/Users/gregor.redelonghi/majstaf_${HST}/${HST}_staf/majvolpejprs"
git_nvol="/usr/bin/git --git-dir=${VOLGITDIR} --work-tree=${VOLWORKDIR}"

ghvol="git@github.com:r-gregor/vlpprs_${HST}.git"
glvol="git@gitlab.com:r-gregor/vlpprs_${HST}.git"

echo "[INFO] Push to ${ghvol} ..."
${git_nvol} push ${ghvol} main
echo "---"

echo "[INFO] Push to ${glvol} ..."
${git_nvol} push ${glvol} main
echo "---"

