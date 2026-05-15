#! /usr/bin/env bash
# filename: load-csv-into-array-test-20260508.sh
# 20260508 v1
# last: 20260508
# ---

fname="personal_links_list_en"
declare -A majlinks


load_links_into_array() {
	while IFS=';' read key value; do
		majlinks["${key}"]="${value}"
	done < ${src}
}

# MAIN

if [ ! -f "${fname}" ]; then
	printf "[ERROR] no such file: ${fname}\n\n"
	exit
else
	src="${fname}"
fi

clear

load_links_into_array

for EL in "${!majlinks[@]}"; do
	printf "[\"%s\"] = \"%s\"\n" "${EL}" "${majlinks["${EL}"]:0:60}..."
done

printf "\n"


