#!/bin/bash

function extract {
    local level=$2
    local nextlevel=$((level+1))
    viewdesc="$(bq show --view $1)"

    for word in $viewdesc
    do
        [[ $word =~ $regex ]]
        if [[ ${BASH_REMATCH[0]} ]]
        then
            match="${BASH_REMATCH[1]}"
            matches+=($match)
            printf '%0.s-' $(seq 1 $level)
            printf " $match \n"
            extract $match $nextlevel
        fi
    done
}

regex="\[([a-zA-Z0-9\.\_\:\-]*\.[a-zA-Z0-9\.\_\:\-]*)\]"
matches=()

extract $1 1

sorted_unique_matches=($(echo "${matches[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

echo
echo "Sorted, unique matches:"
for match in "${sorted_unique_matches[@]}"
do
    echo "$match"
done
