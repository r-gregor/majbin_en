#! /usr/bin/env bash
# filename: majapps-launch.sh
# descpt: Launch fzf-selected app (en)
# 20260527 v10
# last 20260527
# ---


# === GLOBALS ===
runff="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"
runedg="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
moffpth='/c/Program Files/Microsoft Office/root/Office16'

SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
FNAME="majapps_links_list_en"
FPTH="${SRCDIR}/${FNAME}"

declare -A majapps

# === FUNCTIONS ===
load_links_into_array() {
	while IFS=';' read key value; do
		majapps["${key}"]="${value}"
	done < "${FPTH}"
}

get_longest() {
	if [ ! $# -eq 1 ]; then
		printf "[E1] must supply array of sentences as parameter\n\n"
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
	printf "[i] selected: '%s'\n" "${1}"
}

majaps_run() {
	if [ "${selection}" == "" ]; then
		printf "[i] no selection\n\n"
		exit 0
	fi

	case "${selection}" in
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

		"UrbInfo Ljubljana")
			${runff} "https://urbinfo.ljubljana.si/web/profile.aspx?id=Urbinfo@Ljubljana"
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

		"DNEVNO")
			"${runff}" "C:\users\gregor.redelonghi\majstaf_en\r.gregor.en\start.en\dnevno\dnevno-black.html"
			selection_info "${selection}"
			;;

		"Quit")
			printf "\n"
			exit
			;;

		*)
			cygstart "${majapps["${selection}"]}" &>/dev/null
			selection_info "${selection}"
			;;
	esac
}

get_selection_en() {
	selection=$((for key in "${!keys[@]}"; do echo "${keys[$key]}"; done | sort; echo "${delline}"; echo "Quit") | \
		fzf \
		-e \
		--reverse \
		-i \
		--prompt="launch: ")
}

# === MAIN ===
# clear the screen
printf "\033[H\033[2J"

load_links_into_array

# array of keys from majapps
keys=("${!majapps[@]}")

longest_l=$(get_longest keys)
delline=$(for (( i = 0; i < "${#longest_l}"; i++ )); do printf "-"; done )

if [ $# -eq 1 ]; then
	declare -a options
	# ${varname,,} -- convert string to all lowercase ...
	for key in "${keys[@]}"; do
		if [[ "${key,,}" =~ "${1,,}" ]]; then
			options+=("${key}")
		fi
	done

	if [ "${#options[@]}" -gt 1 ]; then
		printf "[E] multiple selections:\n"
		for OPT in "${options[@]}"; do
			printf "${OPT}\n"
		done
		printf "[i] redefine parameter\n\n"
		exit 1
	elif [ "${#options[@]}" -eq 0 ]; then
		printf "[E] no selection\n\n"
		exit 1
	else
		selection="${options[0]}"
	fi

	read -p "[?] launch: ${selection} ... OK?"

	if [[ "${selection}" =~ "OneCommander" ]]; then
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin \
			"${majapps[${selection}]}"
		selection_info "${selection}"
		printf "\n"
		exit
		# continue -- (this instance not inside loop)
	fi
	majaps_run
	printf "\n"
	exit 0
fi

while true; do
	get_selection_en

	# RUN
	if [ "${selection}" == "${delline}" ]; then
		continue
	elif [[ "${selection}" =~ "OneCommander" ]]; then
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin \
			"${majapps[${selection}]}"
		selection_info "${selection}"
		continue
	fi
	majaps_run
done

printf "\n"

