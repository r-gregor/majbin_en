#! /usr/bin/env bash
# filename: majapps-launch.sh
# 20250917 
# 20250919 v1 added runff var for firefox path
# 20251017 v2 run inside infinite loop and added 'q' to quit
#             keys in separate index-ed array to keep display order
# 20260317 v3 $delline calculated from longest KEY line with get_longest function
#             sorted output to fzf command
#             extract KEYS from URLS
# 20260325 v4 case statement instead of 'if/elif/then' block
# 20260408 v5 added continue in if block for OneCommander, so thai it does not print "selected ..." twice
#             as rule inside case statement
# 20260423 v6 put all RUN statemnets into majaps_run() function and add option to select input as parameter
# 20260423 v7 selected input as parameter into array, if multiple option to refine parameter
# 20260424 v8 move 'selection=...' expression into get_selection_en() function
# 20260514 v9 move links to external (csv format with ';' delimiter) file and add load_links_into_array()
#             function to load links from file into associative array
# last: 20260514
# ---

# clear the screen:
printf "\033[H\033[2J"

# globals
runff="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"
runedg="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
moffpth='/c/Program Files/Microsoft Office/root/Office16' #v4

SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))" # v9
FNAME="majapps_links_list_en"                     # v9
FPTH=${SRCDIR}/${FNAME}                           # v9

# assoc array
declare -A majapps

# functions
# v9
load_links_into_array() {
	while IFS=';' read key value; do
		majapps["${key}"]="${value}"
	done < "${FPTH}"
}

get_longest() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR1] must supply array of sentences as parameter"
		exit 1
	fi

	local len=0
	local longest
	local -n lines2=$1 # new way: must call array as < array_name >

	for line in "${lines2[@]}"; do
		llen="${#line}"
		if [ "${llen}" -gt "${len}" ]; then
			len="${llen}"
			longest="${line}"
		else
			continue
		fi
	done

	echo "${longest}"
}

selection_info() {
	printf "[INFO] selected: $1\n"
}

# v6
majaps_run() {
	if [ "x${selection}" == "x" ]; then
		echo -e "[INFO] no selection\n"
		exit
	fi

	case "${selection}" in #v4
		"AutoCAD 2024")
			cygstart "C:\Program Files\Autodesk\AutoCAD 2024\acad.exe"  /product ACAD /language "en-US" &>/dev/null
			selection_info "${selection}"
			;;

		"Nukleus (EN)")
			${runff} "http://jpe-nukleus.jhl.si/PassAuth/AutoAuth.aspx?ReturnUrl=/nukleus/profile.aspx?id=Energetika@Ljubljana"
			selection_info "${selection}"
			;;

		"Razvojne Rešitve (EN)")
			${runff} "https://jpe-arcgis-port.jhl.si/arcgis/apps/webappviewer/index.html?id=b7ec743d0247439fbe941cb6187fa094"
			selection_info "${selection}"
			;;

		"Mintty")
			# cygstart /c/users/gregor.redelonghi/majstaf_en/majprogs_en/cygwin64/bin/mintty.exe -p 300,40 -s 180,40 -
			cygstart /c/users/gregor.redelonghi/majstaf_en/majprogs_en/cygwin64/bin/mintty.exe -s 180,40 -
			selection_info "${selection}"
			;;

		"URE")
			jhl_ure="https://ris.jhl.si/"
			# cygstart "${runedg}" ${jhl_ure}
			"${runedg}" ${jhl_ure}
			selection_info "${selection}"
			;;

		"PROSOTRSKI INFORNMACIJSKI SISTEM (EN)")
			pis="https://pis.eprostor.gov.si/pis.html"
			"${runedg}" ${pis}
			selection_info "${selection}"
			;;

		"Quit")
			exit
			;;
		*)
			cygstart "${majapps["${selection}"]}" &>/dev/null
			selection_info "${selection}"
			;;
	esac
}

# v8
get_selection_en() {
	selection=$((for key in "${!keys[@]}"; do echo "${keys[$key]}"; done | sort; echo "${delline}"; echo "Quit") | \
		fzf \
		-e \
		--reverse \
		-i \
		--prompt="launch: ")
}

# === MAIN ==================================================================================================
load_links_into_array # v6

# array of keys from majapps
keys=("${!majapps[@]}") # v3

longest_l=$(get_longest keys)                                         # v3
delline=$(for((i = 0; i < ${#longest_l}; i++)); do printf "-"; done)  # v3

# v6
if [ $# -eq 1 ]; then
	declare -a options
	# ${varname,,} -- convert string to all lowercase ...
	for key in "${keys[@]}"; do
		if [[ "${key,,}" =~ "${1,,}" ]]; then
			options+=("${key}")
		fi
	done

	if [ "${#options[@]}" -gt 1 ]; then
		printf "[ERROR] multiple selections:\n"
		for OPT in "${options[@]}"; do
			printf "${OPT}\n"
		done
		printf "[INFO] redefine parameter\n\n"
		exit
	elif [ "${#options[@]}" -eq 0 ]; then
		printf "[ERROR] no selection\n\n"
		exit
	else
		selection="${options[0]}"
	fi

	read -p "[INFO] launch: ${selection} ... OK?"

	if [[ "${selection}" =~ "OneCommander" ]]; then #v4
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin
		"${majapps[${selection}]}"
		selection_info "${selection}"
		exit
		# continue # v6 -- (this instance not inside loop)
	fi
	majaps_run
	exit
fi

while true; do
	get_selection_en #v8

	# RUN
	if [ "${selection}" == "${delline}" ]; then #v3
		continue
	elif [[ "${selection}" =~ "OneCommander" ]]; then #v4
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin "${majapps[${selection}]}"
		selection_info "${selection}"
		continue # v5
	fi
	majaps_run # v6
done

