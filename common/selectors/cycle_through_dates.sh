#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: `basename "$0"` <start_date (inclusive, yyyyMMdd format)> <end_date (inclusive, yyyyMMdd format)>"
    exit 1
fi

d=$1
while [ "$d" != $2 ]; do 
  echo "$3$d"
  d=$(date -r `expr $(date -jf"%Y%m%d" "$d" +%s) + 86400` +%Y%m%d)
done

echo "$3$d"