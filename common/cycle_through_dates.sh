#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: `basename "$0"` <start_date (inclusive, yyyyMMdd format)> <end_date (inclusive, yyyyMMdd format)>"
    exit 1
fi

d=$1
while [ "$d" != $2 ]; do 
  echo $d
  d=$(date -r `expr $(date -jf"%Y%m%d" "$d" +%s) + 86400` +%Y%m%d)
done

echo $d