#!/usr/bin/env bash

# $1: regex
# $2: URL

PAGE=$(curl $2)

if [[ $2 =~ [\.A-z_:\/0-9\-]+\/ ]]
then
	BASEPATH=${BASH_REMATCH[0]}

	for WORD in ${PAGE[@]}
	do
		if [[ ${WORD} =~ [A-z_\/0-9\.z%:-]+$1 ]]
		then
			FILE="${BASH_REMATCH[0]}"
			echo "${FILE}"
			curl -O "${FILE}"
			WAIT=$((${RANDOM}*15/32767))
			echo "${WAIT}"
			sleep ${WAIT}
		fi
	done
fi

