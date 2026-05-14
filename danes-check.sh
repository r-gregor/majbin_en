#! /usr/bin/env bash

dest="${HOME}/majstaf/_NERAZPOREJENO/__DANES__"
mcmd="${HOME}/.local/bin/check4emptyd"

result=$(${mcmd} ${dest})

echo "${result}" | grep NOT &>/dev/null

if [ $? -eq 0 ]; then
	result=${result//INFO/WARN}
fi

echo "${result}"
echo

