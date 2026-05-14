#! /bin/bash

### ------------------------------------------------------------------------
### name:       pnp-multi.sh
### author:     RgregoR, 2020
### date:       september 2020
### last chng:  20200908
###
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
###           +-- naziv_faza_teksti
###           +-- naziv_faza_risbe
###
### It pools the basic input data from an external file "seznam.txt"
### as comma separated list of data: trasa,dn,naziv,faza
###
### CHANGE 20220308
### add subdir 'popisi' to basedir
###
### c:\osn_dir
###   |
###   +-- trasa_dn_naziv_faza
###       +-- podloge
###       +-- podatki
###       +-- nacrt
###           +-- teksti
###           +-- risbe
###           +-- popisi
###
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

function msg() {
    cat <<"EOF"
    ##########################################################
    # Script that that creates directory structure for       #
    # organising the project                                 #
    # -----------------------------------------------------  #
    # Logging in: [$HOME/majstaf/logging_en/projekt.log]  #
    ##########################################################
EOF
} # end msg()

function createDirStructure() {
	# clear
	echo
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

	(tms; echo "Starting $0") >> ${gr_logf} ##### start logging 


	echo
    msg

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
	echo "        +-- ${delna_ozn}_teksti"
	echo "        +-- ${delna_ozn}_risbe"
	echo "        +-- ${delna_ozn}_popisi"
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

	mkdir -pv ${osn_dir}/${celotna_ozn}/podloge
	mkdir -pv ${osn_dir}/${celotna_ozn}/podatki
	mkdir -pv ${osn_dir}/${celotna_ozn}/nacrt/${delna_ozn}_{teksti,risbe,popisi}


	printf "%87s\n" | tr " " "-"
	echo "Displaying the directory structure ..."
	tree ${osn_dir}/${celotna_ozn}
	printf "%87s\n" | tr " " "-"
	(tms; echo "SUCCESS!!") | tee -a ${gr_logf} # append to log
	(tms; echo -e "--------------------------------------------------------------------------------\n") >> ${gr_logf}
} # end createDirStructure()


# MAIN
tms; echo "Starting $0 ..." 

# starting the for loop:
for FRAZA in $(cat $HOME/majstaf/majbin/pnp/seznam.pnp); do
    createDirStructure
done
