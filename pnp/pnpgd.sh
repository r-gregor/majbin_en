#! /bin/bash

### ------------------------------------------------------------------------
### name:       pnpgd.sh
### author:     RgregoR, 2020
### date:       september 2020
### last chng:  20200908

### ------------------------------------------------------------------------
### Description:
### script that creates directory structure acording to scheme below for
### organising the project:
### 
### c:\osn_dir
###   |
###   +-- trasa_dn_naziv_faza
###       +-- podloge
###       +-- podatki
###       +-- nacrt
###           +-- za-mnenja
###               +-- teksti
###               +-- risbe
###           +-- za-UE
###               +-- teksti
###               +-- risbe
###
### It pools the basic input data from an external file "seznam.txt"
### as comma separated list of data: trasa,dn,naziv,faza
### ------------------------------------------------------------------------

# setting static variables
# test
# osn_dir="$PWD" 

CURR_YEAR=$(date +%Y)
osn_dir="/c/Users/gregor.redelonghi/${CURR_YEAR}/_${CURR_YEAR}_1_PROJEKTI" 


# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

tms; echo "Starting $0 ..."

if [ $# -ne 1 ]; then
    echo -e "Must supply FRAZA --> \"trasa,dn,naziv,faza[DGD, PZI, PID]\"\n"
    exit 1
fi

FRAZA=$1

clear
trasa="$(echo ${FRAZA} | awk -F "," '{print $1}')"
dn="$(echo ${FRAZA} | awk -F "," '{print $2}')"
naziv="$(echo ${FRAZA} | awk -F "," '{print $3}')"
faza="$(echo ${FRAZA} | awk -F "," '{print $4}')"

celotna_ozn="${trasa}_${dn}_${naziv}_${faza}"
delna_ozn="${naziv}_${faza}"

echo "Celotna ozn=${osn_dir}/${celotna_ozn}"
echo "Delna ozn  =${delna_ozn}"
echo	
read -p "Proceed? Press any key, or ctrl+c to quit!"

##########################################################################

### # passing an entry to a log file

gr_logf=$HOME/majstaf/logging_en/projekt.log

(tms; echo "Starting $0") >> ${gr_logf} ##### start logging_en 

echo
cat <<"EOF"
##########################################################
# Script that that creates directory structure for       #
# organising the project                                 #
# -----------------------------------------------------  #
# logging in: [$HOME/majstaf/logging_en/projekt.log]  #
##########################################################
EOF

echo

# Display the scheme of directory structure:
echo
echo "Data from external file will create directory structure as follows:"
printf "%87s\n" | tr " " "-"
echo "${osn_dir}"
echo "+-- ${celotna_ozn}"
echo "    +-- podloge"
echo "    +-- podatki"
echo "    +-- nacrt"
echo "        +-- za-mnenja"
echo "        |   +-- teksti"
echo "        |   +-- risbe"
echo "        |"
echo "        +-- za-UE"
echo "            +-- teksti"
echo "            +-- risbe"
printf "%87s\n" | tr " " "-"
echo

# Test if a directori already exists!
if [ -e "${osn_dir}/${celotna_ozn}" ]; then
    (tms; echo "Directory [${osn_dir}/${celotna_ozn}] ... EXISTS!") | tee -a ${gr_logf} # append to log
    (tms; echo -e "--------------------------------------------------------------------------------\n") >> ${gr_logf}
    read -p "Press any key to EXIT!"
    
    exit 1

fi

read -p "Press any key to continue or ctrl+c to terminate!"

echo
printf "%87s\n" | tr " " "-"
echo "Creating directory structure ... "
(tms; echo "Creating directory structure:") >> ${gr_logf} # append to log
(tms; echo "${osn_dir}/${celotna_ozn}") >> ${gr_logf} # append to log
# mkdir -pv ${osn_dir}/${celotna_ozn}
mkdir -pv ${osn_dir}/${celotna_ozn}/podloge
mkdir -pv ${osn_dir}/${celotna_ozn}/podatki
mkdir -pv ${osn_dir}/${celotna_ozn}/nacrt
mkdir -pv ${osn_dir}/${celotna_ozn}/nacrt/za-mnenja/{teksti,risbe}
mkdir -pv ${osn_dir}/${celotna_ozn}/nacrt/za-UE/{teksti,risbe}

printf "%87s\n" | tr " " "-"
echo "Displaying the directory structure ..."
tree ${osn_dir}/${celotna_ozn}
printf "%87s\n" | tr " " "-"
(tms; echo "SUCCESS!!") | tee -a ${gr_logf} # append to log
(tms; echo -e "--------------------------------------------------------------------------------\n") >> ${gr_logf}
