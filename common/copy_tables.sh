#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: `basename "$0"` <source_prefix> <destination_prefix> <start_date (inclusive, yyyyMMdd format)> <end_date (inclusive, yyyyMMdd format)>"
    exit 1
fi

bash cycle_through_dates.sh $3 $4 | while read -r; do 

echo "Copying ${1}${REPLY} into ${2}${REPLY}"; 
bq cp -f ${1}${REPLY} ${2}${REPLY}

done