#! /usr/bin/env bash
# filename: gt-testing-testpush.sh
# descpt: git-test-push to all testing repositories to check if PULL from rmeotes is needed
# 20241216: store output of cmd into array instead of external file
# 20241218: read output of cmd directly into array, no more need to run cmd twice
#           c-style for loop
# 20250301: correct output messaging
# 20260924: unified scripts for linux
#           HST and system info from exported global variable
# last: 20260924
# ---


# === GLOBALS ===
# COLOR_SET="\e[1;94m"
COLOR_SET="\e[1;38;5;75m"
COLOR_RESET="\e[0m"
DEST=${HOME}/majstaf/coding2/testing
CURRDIR=$PWD

unset output
unset report

output=()
report=()
> $TESTING_TPUSH_REPORTS



COLOR_RED="\e[1;92m"
COLOR_RESET="\e[0m"

# === FUNCTIONS ===
git_all_remotes_testpush() {
	unset rmts
	unset rmt_urls
	readarray -t rmts < <(git remote)
	for rmt in "${rmts[@]}"; do
		rmt_urls+=( $(git remote get-url "$rmt") )
	done

	for rmt_url in "${rmt_urls[@]}"; do
		printf "[i] git testpush in: '%s' ..." "${rmt_url}"
		output=$(/usr/bin/git push --dry-run "${rmt_url}" main 2>&1)
		echo "$output" | grep 'reject\|pull' &> /dev/null
		if [[ $? -eq 0 ]]; then
			printf " ${COLOR_RED} NEED TO PULL FROM REMOTE\n"
			printf "${COLOR_RESET}"
		else
			printf " no action required\n"
		fi
	done
}

# === MAIN ===
cd ${DEST}

printf "============================================\n"
printf "[i] running gt-testing-testpush ...\n"
printf "============================================\n"
for DDD in $(ls -d *); do
	printf "${COLOR_SET}"
	printf "*** git testpush in ${DDD} ... ***\n"
	printf "${COLOR_RESET}"
	cd "$DDD" &>/dev/null
	readarray -t output < <(git_all_remotes_testpush)
	for LINE in "${output[@]}"; do
		if [[ "${LINE}" =~ PULL ]]; then
			msg="$(printf "[!] git testpush in: ${DDD} ... NEED TO PULL FROM REMOTE\n")"
			readarray -t report < <(echo -e "$msg")
			printf "${LINE}\n"
			break
		else
			printf "${LINE}\n"
		fi
	done
	cd ..
done

printf "${COLOR_SET}"
if [ ${#report[@]} -gt 0 ]; then
	printf "\n"
	for (( j=0; j<${#report[@]}; j++)); do
		# printf "*** ${report[$j]} ***\n"
		printf "*** ${report[$j]} ***\n" | tee -a $TESTING_TPUSH_REPORTS
	done
else
	printf "\n"
	printf "*** [i] no action required ***\n"
fi
printf "${COLOR_RESET}"

cd "${CURRDIR}"

printf "\n"

