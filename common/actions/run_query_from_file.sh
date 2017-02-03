#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: `basename "$0"` <query_file> <destination_prefix> <start_date (inclusive, yyyyMMdd format)> <end_date (inclusive, yyyyMMdd format)> <job_spawn_interval>"
    exit 1
fi

QUERY=`cat $1`

while read -r; do 

	echo "Executing query $(eval echo ${QUERY}) and saving result in ${2}${REPLY}"; 
	bq --nosync query --replace --destination_table "${2}${REPLY}" --allow_large_results "$(eval echo ${QUERY})"

	sleep $5
done